$line = <STDIN>;	
$count = 0;
$count1 = 0;		
			
while($line)
{
	
	@word = split('\s+',$line);

	if(@word[0] eq "s" or @word[0] eq "r")
	{
		if(@word[1] eq "cbr")
		{
			$count1 = $count1 + 1;
		}
		if(@word[1] eq "AODV")
		{
			$count = $count + 1;
		}

	}
		
	$line = <STDIN>;	
}

$opt = $count / $count1;
$optp = $opt * 100;
# print "total count $count1\n";

my $file_path = "coh_ratio.txt";  # Replace with your file path
open(my $file_handle, '>>', $file_path) or die "Could not open file '$file_path' for append: $!";

my $data_to_append = "$optp\n";
print $file_handle $data_to_append;

close $file_handle or die "Error closing file '$file_path': $!";


