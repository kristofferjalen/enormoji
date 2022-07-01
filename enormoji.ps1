.\gifsicle.exe --resize 1280x1280 --colors 256 --output resized.gif .\businessparrot.gif 

.\gifsicle.exe --explode .\resized.gif

for ($y=0; $y -lt 10; $y++) {
	for ($x=0; $x -lt 10; $x++) {
		.\gifsicle.exe --crop $($x*128),"$($y*128)+128x128" --output output\megabusiness-$y-$x.gif .\resized.gif
		$slack = $slack + ":megabusiness-$y-$x" + ":"
		$html = $html + "<img src=""output/megabusiness-$y-$x.gif"">"
	}
	$slack = $slack + "`n"
	$html = $html + "<br>"
}

rm .\resized*

Write-Output $slack
New-Item -Path "." -Name "preview.html" -ItemType File -Value $html -Force