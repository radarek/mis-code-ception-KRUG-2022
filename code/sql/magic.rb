$data=[]
$res=[]
%w[DROP ALTER INTO EXISTS NOT IF TABLE CREATE INSERT int].each { |fn| define_method(fn){|*|fn} }
def `(_)= $data
def SELECT(_)= $res<<$data.dup
def FROM(_)= 1
def varchar(_)= nil
def name(_)= _ ? ->{_1.name=~_} : :name
def COLUMN(_)= _
def ADD(_)= $table=Struct.new(*$table.members,_)
def id(_)= $table=Struct.new(:id)
def VALUES(*values)= $data<<$table.new(*values)
def LIKE(_)= /^#{_.gsub'%','.*'}$/
def WHERE(_)= $res[-1]=$res[-1].select(&_)

at_exit do
  $res.each do |records|
    puts $table.members.join("\t"), records.map{_1.to_a*"\t"}
  end
end
