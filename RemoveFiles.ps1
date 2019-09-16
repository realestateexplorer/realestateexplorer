#$inDir = 'C:\TranDataLogs\DataLogs'
#$inDir = 'C:\VSFiles'
#$inDir = 'C:\TranDataLogs\EA100'
$inDir = 'C:\TranDataLogs\VSFiles'
#C:\Users\XBBNNTG\OneDrive - BNY Mellon\Documents\Mike's\BNY\EA100

#Get-ChildItem -Path "$inDir" -Include *.csv,*.xlsx,*.html,*.zip,*.evtx,*.out,*txt,*.jpeg,*.jpg,*.xml,*.msi.,*.cab,*.bmp,*.gif,*.emz,*.msg  -Recurse | Remove-Item
#Get-ChildItem -Path "$inDir" -Include *.csv,*.xlsx,*.zip,*.evtx,*.out,*txt,*.jpeg,*.jpg,*.xml,*.msi.,*.cab,*.bmp,*.gif,*.emz,*.msg  -Recurse | Remove-Item

<#
Remove-Item -Recurse -Path "$inDir\SysinternalsSuite\*"
Remove-Item -Recurse -Path "$inDir\Transfer\*"
Remove-Item -Recurse -Path "$inDir\TestHarness\*"
Remove-Item -Recurse -Path "$inDir\AutoHotkey_1.1.26.01\*"
Remove-Item -Recurse -Path "$inDir\ImagingCode_DM\EDG_ForDCI_Test\*"
Remove-Item -Recurse -Path "$inDir\my-blog\*"
Remove-Item -Recurse -Path "$inDir\React\*"
Remove-Item -Recurse -Path "$inDir\Vue\*"
#Remove-Item -Recurse -Path "$inDir\*.csv"
#Remove-Item -Recurse -Path "$inDir\*.xlsx"
#Remove-Item -Recurse -Path "$inDir\*.html"
#Remove-Item -Recurse -Path "$inDir\*.zip"
#Remove-Item -Recurse -Path "$inDir\*.evtx"
#Remove-Item -Recurse -Path "$inDir\*.out"
#>
#Compress-Archive -Force -Path "$inDir\*" -DestinationPath "C:\TranDataLogs\ABC.zip"
Compress-Archive -Force -Path "$inDir\*" -DestinationPath "C:\TranDataLogs\CDE.zip"

#https://gist.github.com/jehugaleahsa/e23d90f65f378aff9aa254e774b40bc7

function join($path)
{
    $files = Get-ChildItem -Path "$path.*.part" | Sort-Object -Property @{Expression={
        $shortName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
        $extension = [System.IO.Path]::GetExtension($shortName)
        if ($extension -ne $null -and $extension -ne '')
        {
            $extension = $extension.Substring(1)
        }
        [System.Convert]::ToInt32($extension)
    }}
    $writer = [System.IO.File]::OpenWrite($path)
    foreach ($file in $files)
    {
        $bytes = [System.IO.File]::ReadAllBytes($file)
        $writer.Write($bytes, 0, $bytes.Length)
    }
    $writer.Close()
}

#join "C:\path\to\file"

function split($path, $chunkSize=25000000)
{
    $fileName = [System.IO.Path]::GetFileNameWithoutExtension($path)
    $directory = [System.IO.Path]::GetDirectoryName($path)
    $extension = [System.IO.Path]::GetExtension($path)

    $file = New-Object System.IO.FileInfo($path)
    $totalChunks = [int]($file.Length / $chunkSize) + 1
    $digitCount = [int][System.Math]::Log10($totalChunks) + 1

    $reader = [System.IO.File]::OpenRead($path)
    $count = 0
    $buffer = New-Object Byte[] $chunkSize
    $hasMore = $true
    while($hasMore)
    {
        $bytesRead = $reader.Read($buffer, 0, $buffer.Length)
        $chunkFileName = "$directory\$fileName$extension.{0:D$digitCount}.part"
        $chunkFileName = $chunkFileName -f $count
        $output = $buffer
        if ($bytesRead -ne $buffer.Length)
        {
            $hasMore = $false
            $output = New-Object Byte[] $bytesRead
            [System.Array]::Copy($buffer, $output, $bytesRead)
        }
        [System.IO.File]::WriteAllBytes($chunkFileName, $output)
        ++$count
    }

    $reader.Close()
}

split "C:\TranDataLogs\CDE.zip"