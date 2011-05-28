<?
$bigimg = imagecreatefrompng('genesisworld_big.png');
$s = 300;
$x = 30;
$y = 9;

for($i=1; $i<=$x; $i++) {
    for($j=1; $j<=$y; $j++) {
	$img = imagecreatetruecolor($s,$s);
	imagecopy($img, $bigimg, 0, 0, ($i*$s), ($j*$s), $s, $s);
	imagestring($img, 10,40,40,"$i/$j",imagecolorallocate($img, 255, 255, 255));
	imagepng($img, "/home/basti/genesis/static/images/map/$i-$j.png");
	unset($img);
	echo $i.'/'.$j."\n";
    }
}