#inetmgr.exe
#Import-Module SQLPS -DisableNameChecking
#@@SERVERNAME
##$submitConfl = $false
$submitConfl = $true
$PageID=494345283 # https://confluence.bnymellon.net/display/~XBBNNTG/DocumentCustody_Server_Status
#$loginCheck = $null
$outHTML = 'C:\DataLogs\Confluence\serverStatus.html'
$emptyRow = @()
#https://dcitwcgf.qa.bnymellon.net/DCI/BusinessObjects/WebServices/Image/ImageUpdate.svc ???

#DDC 3577236.94 MB
#MDC 1148988.75 MB
#PMJ 522952.19 MB
#DCI 669376.00 MB

#https://dcitbizgf.qa.bnymellon.net/BusinessObjects/WebServices/Image/ImageUpdate.svc
#https://dcitbizgf.qa.bnymellon.net/BusinessObjects/WebServices/Image/ImageCreate.svc


[Net.ServicePointManager]::SecurityProtocol = [System.Security.Authentication.SslProtocols] "tls, tls11, tls12"
$startTime = Get-Date

#$cred = Get-Credential XBBNNTG
##$pwdFile = 'C:\DataLogs\Confluence\secretFile.txt'
##$cred | Export-CliXml -Path $pwdFile

#GF Servers
### to export pass to file
#$credGF = Get-Credential AMS\SXBBNNTG
#$pwdFileGF = 'C:\DataLogs\GreenField\secretFile.txt'
#$credGF | Export-CliXml -Path $pwdFileGF


$pwdFileGF = 'C:\DataLogs\GreenField\secretFile.txt' 
$credGF = Import-CliXml $pwdFileGF


$serverGF = @{ 

d0=@{ID='DCI_DEV';server='';location='';URL=''}
d1=@{ID='DCI_DEV_TWC_GF';server='WC13A10098DV00';location='CNJ';URL='dcitwcgf.dev.bnymellon.net';site='/dci/login/login.aspx'}
d2=@{ID='DCI_DEV_TBIZ_GF';server='WC13A10099DV00';location='CNJ';URL='';site='/BusinessObjects/WebServices/Image/ImageUpdate.svc'}
d3=@{ID='DCI_DEV_TREP_GF';server='WC03A10044DV00';location='CNJ';URL='';site='/reports/browse/'}
d4=@{ID='DCI_DEV_TDB_GF';server='WC03A10017DV00';location='CNJ';URL='dci-ms4.db.dev.bnymcloud.net';instance='WC03A10017DV00\MSDCID03';SP_REC='';PM_SSRS=''}
d5=@{ID='DCI_DEV_RSDB_GF';server='WC10B10188DV00';location='CNJ';URL='dci-ms5.db.dev.bnymellon.net'}

d6=@{ID='DCI_UAT';server='';location='';URL=''}
d7=@{ID='DCI_UAT_TWC_GF';server='WT03A10051QV00';location='TPC';URL='dcitwcgf.qa.bnymellon.net';site='/dci/login/login.aspx'}
d8=@{ID='DCI_UAT_TWC_GF';server='WT03A10052QV00';location='TPC';URL='dcitwcgf.qa.bnymellon.net';site='/dci/login/login.aspx'}
d9=@{ID='DCI_UAT_TBIZ_GF';server='WT03A10053QV00';location='TPC';URL='dcitbizgf.qa.bnymellon.net';site='/BusinessObjects/WebServices/Image/ImageUpdate.svc'}
d10=@{ID='DCI_UAT_TBIZ_GF';server='WT03A10054QV00';location='TPC';URL='dcitbizgf.qa.bnymellon.net';site='/BusinessObjects/WebServices/Image/ImageCreate.svc'}
d11=@{ID='DCI_UAT_TREP_GF';server='WT56B10230QV00';location='TPC';URL='dcitrepgf.qa.bnymellon.net';site='/reports/browse/'}
d12=@{ID='DCI_UAT_TDB_GF';server='WT08A10216QV00';location='TPC';URL='dci-ms2.db.qa.bnymcloud.net';instance='WT08A10216QV00\MSDCIQ02';SP_REC='';PM_SSRS=''}
d13=@{ID='DCI_UAT_RSDB_GF';server='WT08A10216QV00';location='TPC';URL='dci-ms7.db.qa.bnymellon.net'}

d14=@{ID='DCI_UAT_TWC_GF';server='WC11B10032QV00';location='CNJ';URL='dcitwcgf.qa.bnymellon.net';site='/dci/login/login.aspx'}
d15=@{ID='DCI_UAT_TWC_GF';server='WC11B10033QV00';location='CNJ';URL='dcitwcgf.qa.bnymellon.net';site='/dci/login/login.aspx'}
d16=@{ID='DCI_UAT_TBIZ_GF';server='WC11B10034QV00';location='CNJ';URL='dcitbizgf.qa.bnymellon.net';site='/BusinessObjects/WebServices/Image/ImageUpdate.svc'}
d17=@{ID='DCI_UAT_TBIZ_GF';server='WC11B10035QV00';location='CNJ';URL='dcitbizgf.qa.bnymellon.net';site='/BusinessObjects/WebServices/Image/ImageCreate.svc'}
d18=@{ID='DCI_UAT_TREP_GF';server='WC53B10059QV00';location='CNJ';URL='dcitrepgf.qa.bnymellon.net';site='/reports/browse/'}
d19=@{ID='DCI_UAT_TDB_GF';server='WC11B10100QV00';location='CNJ';URL='dci-ms2.db.qa.bnymcloud.net';instance='WC11B10100QV00\MSDCIQ02';SP_REC='';PM_SSRS=''}
d20=@{ID='DCI_UAT_RSDB_GF';server='WC11B10160QV00';location='CNJ';URL='dci-ms7.db.qa.bnymellon.net'}

d21=@{ID='DCI_PRD';server='';location='';URL=''}
d22=@{ID='DCI_PRD_TWC_GF';server='WT10A10101PV00';location='TPC';URL='dcitwcgf.bnymellon.net';site='/dci/login/login.aspx'}
d23=@{ID='DCI_PRD_TWC_GF';server='WT10A10102PV00';location='TPC';URL='dcitwcgf.bnymellon.net';site='/dci/login/login.aspx'}
d24=@{ID='DCI_PRD_TBIZ_GF';server='WT10A10103PV00';location='TPC';URL='dcitbizgf.bnymellon.net';site='/BusinessObjects/WebServices/Image/ImageUpdate.svc'}
d25=@{ID='DCI_PRD_TBIZ_GF';server='WT10A10104PV00';location='TPC';URL='dcitbizgf.bnymellon.net';site='/BusinessObjects/WebServices/Image/ImageCreate.svc'}
d26=@{ID='DCI_PRD_TREP_GF';server='WT06A10012PV00';location='TPC';URL='dcitrepgf.bnymellon.net';site='/reports/browse/'}
d27=@{ID='DCI_PRD_TDB_GF';server='WT10A10108PV00';location='TPC';URL='dci-ms3.db.prod.bnymcloud.net';instance='WT10A10108PV00\MSDCIP02';SP_REC='';PM_SSRS=''}
d28=@{ID='DCI_PRD_RSDB_GF';server='WT10A10114PV00';location='TPC';URL='dci-ms3.db.prod.bnymcloud.net'}

d29=@{ID='DCI_PRD_TWC_GF';server='WC10A10113PV00';location='CNJ';URL='dcitwcgf.bnymellon.net';site='/dci/login/login.aspx'}
d30=@{ID='DCI_PRD_TWC_GF';server='WC10A10114PV00';location='CNJ';URL='dcitwcgf.bnymellon.net';site='/dci/login/login.aspx'}
d31=@{ID='DCI_PRD_TBIZ_GF';server='WC10A10115PV00';location='CNJ';URL='dcitbizgf.bnymellon.net';site='/BusinessObjects/WebServices/Image/ImageUpdate.svc'}
d32=@{ID='DCI_PRD_TBIZ_GF';server='WC10A10116PV00';location='CNJ';URL='dcitbizgf.bnymellon.net';site='/BusinessObjects/WebServices/Image/ImageCreate.svc'}
d33=@{ID='DCI_PRD_TREP_GF';server='WC06A10014PV00';location='CNJ';URL='dcitrepgf.bnymellon.net';site='/reports/browse/'}
d34=@{ID='DCI_PRD_TDB_GF';server='WC10A10120PV00';location='CNJ';URL='dci-ms3.db.prod.bnymcloud.net';instance='WC10A10120PV00\MSDCIP02';SP_REC='';PM_SSRS=''}
d35=@{ID='DCI_PRD_RSDB_GF';server='WC10A10127PV00';location='CNJ';URL='dci-ms3.db.prod.bnymcloud.net'}

d36=@{ID='PMJ_DEV';server='';location='';URL=''}
d37=@{ID='PMJ_DEV_TWC_GF';server='WT10B10125DV00';location='TPC';URL='pmjtwcgf.dev.bnymellon.net';site='/dci/login/login.aspx'}
d38=@{ID='PMJ_DEV_TBIZ_GF';server='WT10B10126DV00';location='TPC';URL='';site=''}
d39=@{ID='PMJ_DEV_TAP_GF';server='WT10B10129DV00';location='TPC';URL='';site=''}
d40=@{ID='PMJ_DEV_TREP_GF';server='WT10B10128DV00';location='TPC';URL='';site='/reports/browse/'}
d41=@{ID='PMJ_DEV_TDB_GF';server='WT10B10127DV00';location='TPC';URL='pmj-ms4.db.dev.bnymellon.net';instance='WT10B10127DV00\MSPMJD04';SP_REC='ams\pmjm72m';PM_SSRS='AMS\pmjm60m'}
d42=@{ID='PMJ_DEV_RSDB_GF';server='WT10B10130DV00';location='TPC';URL='pmj-ms5.db.dev.bnymellon.net'}

d43=@{ID='PMJ_UAT';server='';location='';URL=''}
d44=@{ID='PMJ_UAT_TWC_GF';server='WT52B10026QV00';location='TPC';URL='pmjtwcgf.qa.bnymellon.net';site='/promerit/login/login.aspx'}
d45=@{ID='PMJ_UAT_TWC_GF';server='WT52B10027QV00';location='TPC';URL='pmjtwcgf.qa.bnymellon.net';site='/promerit/login/login.aspx'}
d46=@{ID='PMJ_UAT_TBIZ_GF';server='WT52B10028QV00';location='TPC';URL='pmjtbizgf.qa.bnymellon.net';site=''}
d47=@{ID='PMJ_UAT_TBIZ_GF';server='WT52B10029QV00';location='TPC';URL='pmjtbizgf.qa.bnymellon.net';site=''}
d48=@{ID='PMJ_UAT_TAP_GF';server='WT52B10031QV00';location='TPC';URL='pmjtapgf.qa.bnymellon.net';site=''}
d49=@{ID='PMJ_UAT_TAP_GF';server='WT52B10032QV00';location='TPC';URL='pmjtapgf.qa.bnymellon.net';site=''}
d50=@{ID='PMJ_UAT_TREP_GF';server='WT56B10296QV00';location='TPC';URL='pmjtrepgf.qa.bnymellon.net';site='/reports/browse/'} #https://pmjtrepgf.qa.bnymellon.net/reports/browse/
d51=@{ID='PMJ_UAT_TDB_GF';server='WT52B10030QV00';location='TPC';URL='pmj-ms7.db.qa.bnymellon.net';instance='WT52B10030QV00\MSPMJQ01';SP_REC='ams\pmjm71m';PM_SSRS='AMS\pmjm61m'}
d52=@{ID='PMJ_UAT_RSDB_GF';server='WT52B10033QV00';location='TPC';URL='pmj-ms8.db.qa.bnymellon.net'}

d53=@{ID='PMJ_UAT_TWC_GF';server='WC03A10158QV00';location='CNJ';URL='pmjtwcgf.qa.bnymellon.net';site='/promerit/login/login.aspx'}
d54=@{ID='PMJ_UAT_TWC_GF';server='WC03A10159QV00';location='CNJ';URL='pmjtwcgf.qa.bnymellon.net';site='/promerit/login/login.aspx'}
d55=@{ID='PMJ_UAT_TBIZ_GF';server='WC03A10160QV00';location='CNJ';URL='pmjtbizgf.qa.bnymellon.net';site=''}
d56=@{ID='PMJ_UAT_TBIZ_GF';server='WC03A10161QV00';location='CNJ';URL='pmjtbizgf.qa.bnymellon.net';site=''}
d57=@{ID='PMJ_UAT_TAP_GF';server='WC03A10162QV00';location='CNJ';URL='pmjtapgf.qa.bnymellon.net';site=''}
d58=@{ID='PMJ_UAT_TAP_GF';server='WC03A10163QV00';location='CNJ';URL='pmjtapgf.qa.bnymellon.net';site=''}
d59=@{ID='PMJ_UAT_TREP_GF';server='WC53B10125QV00';location='CNJ';URL='pmjtrepgf.qa.bnymellon.net';site='/reports/browse/'}
d60=@{ID='PMJ_UAT_TDB_GF';server='WC53B10124QV00';location='CNJ';URL='pmj-ms7.db.qa.bnymellon.net';instance='WC53B10124QV00\MSPMJQ01';SP_REC='ams\pmjm71m';PM_SSRS='AMS\pmjm61m'}
d61=@{ID='PMJ_UAT_RSDB_GF';server='WC52B10308QV00';location='CNJ';URL='pmj-ms8.db.qa.bnymellon.net'}

d62=@{ID='PMJ_PRD';server='';location='';URL=''}
d63=@{ID='PMJ_PRD_TWC_GF';server='WT10A10199PV00';location='TPC';URL='pmjtwcgf.bnymellon.net';site='/promerit/login/login.aspx'}
d64=@{ID='PMJ_PRD_TWC_GF';server='WT10A10200PV00';location='TPC';URL='pmjtwcgf.bnymellon.net';site='/promerit/login/login.aspx'}
d65=@{ID='PMJ_PRD_TBIZ_GF';server='WT10A10201PV00';location='TPC';URL='pmjtbizgf.bnymellon.net';site=''}
d66=@{ID='PMJ_PRD_TBIZ_GF';server='WT10A10202PV00';location='TPC';URL='pmjtbizgf.bnymellon.net';site=''}
d67=@{ID='PMJ_PRD_TAP_GF';server='WT10A10204PV00';location='TPC';URL='pmjtapgf.bnymellon.net';site=''}
d68=@{ID='PMJ_PRD_TAP_GF';server='WT10A10205PV00';location='TPC';URL='pmjtapgf.bnymellon.net';site=''}
d69=@{ID='PMJ_PRD_TREP_GF';server='WT06A10093PV00';location='TPC';URL='pmjtrepgf.bnymellon.net';site='/reports/browse/'}
d70=@{ID='PMJ_PRD_TDB_GF';server='WT12A10054PV00';location='TPC';URL='pmj-ms6.db.prod.bnymellon.net';instance='';SP_REC='ams\pmjm73m';PM_SSRS='AMS\pmjm61m'}
d71=@{ID='PMJ_PRD_RSDB_GF';server='WT12A10055PV00';location='TPC';URL='pmj-ms9.db.prod.bnymellon.net'}

d72=@{ID='PMJ_PRD_TWC_GF';server='WC10A10213PV00';location='CNJ';URL='pmjtwcgf.bnymellon.net';site='/promerit/login/login.aspx'}
d73=@{ID='PMJ_PRD_TWC_GF';server='WC10A10215PV00';location='CNJ';URL='pmjtwcgf.bnymellon.net';site='/promerit/login/login.aspx'}
d74=@{ID='PMJ_PRD_TBIZ_GF';server='WC10A10216PV00';location='CNJ';URL='pmjtbizgf.bnymellon.net';site=''}
d75=@{ID='PMJ_PRD_TBIZ_GF';server='WC10A10217PV00';location='CNJ';URL='pmjtbizgf.bnymellon.net';site=''}
d76=@{ID='PMJ_PRD_TAP_GF';server='WC10A10218PV00';location='CNJ';URL='pmjtapgf.bnymellon.net';site=''}
d77=@{ID='PMJ_PRD_TAP_GF';server='WC10A10219PV00';location='CNJ';URL='pmjtapgf.bnymellon.net';site=''}
d78=@{ID='PMJ_PRD_TREP_GF';server='WC06A10113PV00';location='CNJ';URL='pmjtrepgf.bnymellon.net';site='/reports/browse/'}
d79=@{ID='PMJ_PRD_TDB_GF';server='WC12A10056PV00';location='CNJ';URL='pmj-ms6.db.prod.bnymellon.net';instance='';SP_REC='ams\pmjm73m';PM_SSRS='AMS\pmjm61m'}
d80=@{ID='PMJ_PRD_RSDB_GF';server='WC12A10057PV00';location='CNJ';URL='pmj-ms9.db.prod.bnymellon.net'}

d81=@{ID='MDC_DEV';server='';location='';URL=''}
d82=@{ID='MDC_DEV_TWC_GF';server='wt10b10179dv00';location='TPC';URL='mdctwcgf.dev.bnymellon.net';site='/mdc/login/login.aspx'}
d83=@{ID='MDC_DEV_TBIZ_GF';server='wt10b10183dv00';location='TPC';URL='';site=''}
d84=@{ID='MDC_DEV_TREP_GF';server='wt10b10182dv00';location='TPC';URL='';site='/reports/browse/'}
d85=@{ID='MDC_DEV_TDB_GF';server='wt10b10180dv00';location='TPC';URL='mdc-ms1.db.dev.bnymellon.net';instance='WT10B10180DV00\MSMDCD05';SP_REC='';PM_SSRS=''}
d86=@{ID='MDC_DEV_RSDB_GF';server='wt10b10181dv00';location='TPC';URL='mdc-ms2.db.dev.bnymellon.net'}

d87=@{ID='MDC_UAT';server='';location='';URL=''}
d88=@{ID='MDC_UAT_TWC_GF';server='WT66B10054QV00';location='TPC';URL='mdctwcgf.qa.bnymellon.net';site='/mdc/login/login.aspx'}
d89=@{ID='MDC_UAT_TWC_GF';server='WT66B10055QV00';location='TPC';URL='mdctwcgf.qa.bnymellon.net';site='/mdc/login/login.aspx'}
d90=@{ID='MDC_UAT_TBIZ_GF';server='WT66B10056QV00';location='TPC';URL='mdctbizgf.qa.bnymellon.net';site=''}
d91=@{ID='MDC_UAT_TBIZ_GF';server='WT66B10057QV00';location='TPC';URL='mdctbizgf.qa.bnymellon.net';site=''}
d92=@{ID='MDC_UAT_TBIZ_GF';server='WT66B10058QV00';location='TPC';URL='mdctbizgf.qa.bnymellon.net';site=''}
d93=@{ID='MDC_UAT_TAP_GF';server='WT66B10059QV00';location='TPC';URL='mdctapgf.qa.bnymellon.net';site=''}
d94=@{ID='MDC_UAT_TAP_GF';server='WT66B10060QV00';location='TPC';URL='mdctapgf.qa.bnymellon.net';site=''}
d95=@{ID='MDC_UAT_TREP_GF';server='WT66B10063QV00';location='TPC';URL='mdctrepgf.qa.bnymellon.net';site='/reports/browse/'}
d96=@{ID='MDC_UAT_TREP_GF';server='WT66B10064QV00';location='TPC';URL='mdctrepgf.qa.bnymellon.net';site='/reports/browse/'}
d97=@{ID='MDC_UAT_TDB_GF';server='WT66B10065QV00';location='TPC';URL='';instance='';SP_REC='';PM_SSRS=''}
d98=@{ID='MDC_UAT_RSDB_GF';server='WT66B10066QV00';location='TPC';URL=''}

d99=@{ID='MDC_UAT_TWC_GF';server='WC63B10064QV00';location='CNJ';URL='mdctwcgf.qa.bnymellon.net';site='/mdc/login/login.aspx'}
d100=@{ID='MDC_UAT_TWC_GF';server='WC63B10065QV00';location='CNJ';URL='mdctwcgf.qa.bnymellon.net';site='/mdc/login/login.aspx'}
d101=@{ID='MDC_UAT_TBIZ_GF';server='WC63B10066QV00';location='CNJ';URL='mdctbizgf.qa.bnymellon.net';site=''}
d102=@{ID='MDC_UAT_TBIZ_GF';server='WC63B10067QV00';location='CNJ';URL='mdctbizgf.qa.bnymellon.net';site=''}
d103=@{ID='MDC_UAT_TBIZ_GF';server='WC63B10068QV00';location='CNJ';URL='mdctbizgf.qa.bnymellon.net';site=''}
d104=@{ID='MDC_UAT_TAP_GF';server='WC63B10069QV00';location='CNJ';URL='mdctapgf.qa.bnymellon.net';site=''}
d105=@{ID='MDC_UAT_TAP_GF';server=' WC63B10070QV00';location='CNJ';URL='mdctapgf.qa.bnymellon.net';site=''}
d106=@{ID='MDC_UAT_TREP_GF';server='WC63B10072QV00';location='CNJ';URL='mdctrepgf.qa.bnymellon.net';site='/reports/browse/'}
d107=@{ID='MDC_UAT_TREP_GF';server='WC63B10073QV00';location='CNJ';URL='mdctrepgf.qa.bnymellon.net';site='/reports/browse/'}
d108=@{ID='MDC_UAT_TDB_GF';server='WC63B10074QV00';location='CNJ';URL='';instance='';SP_REC='';PM_SSRS=''}
d109=@{ID='MDC_UAT_RSDB_GF';server='WC63B10075QV00';location='CNJ';URL=''}

d110=@{ID='DDC_DEV';server='';location='';URL=''}
d111=@{ID='DDC_DEV_TWC_GF';server='wt10b10124dv00';location='TPC';URL='ddctwcgf.dev.bnymellon.net';site='/ddc/login/login.aspx'}
d112=@{ID='DDC_DEV_TBIZ_GF';server='wt10b10120dv00';location='TPC';URL='';site=''}
d113=@{ID='DDC_DEV_TREP_GF';server='wt10b10120dv00';location='TPC';URL='';site='/reports/browse/'}
d114=@{ID='DDC_DEV_TDB_GF';server='wt10b10122dv00';location='TPC';URL='ddc-ms1.db.dev.bnymellon.net';instance='';SP_REC='';PM_SSRS=''}
d115=@{ID='DDC_DEV_RSDB_GF';server='wt10b10121dv00';location='TPC';URL=''}

}

#Import-Module SQLPS -DisableNameChecking

#$n = 0
$dataOut = @()
$inData = @()
#$inData = "<h3>Server And URL Status At $((Get-Date).ToString("yyy-MM-dd HH:mm:ss"))</h3>"
$inData = "<h3>Server And Application Readiness Status On $((Get-Date).ToString("yyy-MM-dd"))</h3>"
$inData += "<p>(that should match software/GreenField requirements)</p>"

$inData += "<h4>Database size reported by SSMS in GB: DCI-669, PMJ-523, MDC-1149, DDC-3577<br />
MBMS: 2X the MDF file of available space on a drive. If the MDF has a lot of Blank Space you may be able to reduce the physical file size temporarily.<br />
MBMS TDB servers: 12 CPU, 64 GB RAM<br />
MBMS other servers: 4 CPU, 16 GB RAM</h4>"


For($i = 0; $i -le 115; $i++){
#For($i = 0; $i -le 92; $i++){
#For($i = 36; $i -le 92; $i++){ #Start PMJ DEV
#For($i = 51; $i -le 51; $i++){
#For($i = 50; $i -le 50; $i++){
#For($i = 82; $i -le 82; $i++){
#For($i = 37; $i -le 37; $i++){ #disk space
#For($i = 50; $i -le 50; $i++){ #Trep call https://pmjtrepgf.qa.bnymellon.net/reports
    
    $i
    $resourceID = "d$i"
    $ID = $serverGF.$resourceID.ID
    $server = $serverGF.$resourceID.server
    $server
    $url = $serverGF.$resourceID.url
    $location = $serverGF.$resourceID.location
    #$site = $serverGF.$resourceID.site

    #$FreeSpace = @($null, $null, $null)
    #$Size = @($null, $null, $null)
    $disk = @($null, $null, $null)
    $loginCheck = $null
    $Port80TestResult = ''
    $Port443TestResult = ''
    $urlTestResult = ''
    #$outDiskSpace = @($null, $null, $null)
    $outDiskSpace = $null
    $outProcessor = $null
    $outMemory = $null
    $outCertificate = $null
    $StatusCode = $null

    #if(($server -ne '') -and ($ID -notlike "*DB*")) {
    #if($server -ne '') {
    if($server) {

        if($url) {
            $urlTest = Test-NetConnection -ComputerName $url
            $urlTestResult = $urlTest.PingSucceeded

            Try {
                #if(($ID -like "*TREP*") -or ($ID -like "*TWC*")) {
                if($ID -notlike "*DB*") {
                    $site = $serverGF.$resourceID.site
                    #$site = $serverGF.$resourceID.site
                    if($site) {
                        $response = Invoke-WebRequest "https://$url$site" -Method get -Credential $credGF
                    }
                    else {
                        $response = Invoke-WebRequest "https://$url" -Method get -Credential $credGF
                    }
                
                    if($response.StatusCode -eq 200) {
                        $StatusCode = $true
                    }
                    else {
                        $StatusCode = $false
                    }
                    #$StatusCode = $response.StatusCode
                    $StatusCode
                }
            }
            Catch {
                $StatusCode = $false
            }
        }

    if((Test-NetConnection -ComputerName $server).PingSucceeded) {
        if($ID -notlike "*DB*") {
            $Port80Test = Test-NetConnection -ComputerName $server -Port 80
            $Port80TestResult = $Port80Test.TcpTestSucceeded
            #$Port80TestResult
            $Port443Test = Test-NetConnection -ComputerName $server -Port 443
            $Port443TestResult = $Port443Test.TcpTestSucceeded
            #$Port443TestResult
        }
        
        Try {
            #$SystemEvents1 = Get-WmiObject -class win32_processor -computername $server -ErrorAction Stop | Select LoadPercentage
            #$SystemEvents2 = Get-WmiObject Win32_OperatingSystem -ComputerName $server -ErrorAction Stop | Select TotalVirtualMemorySize,FreeVirtualMemory
            #Get-WmiObject Win32_OperatingSystem -ComputerName $server -Credential $credGF
            $processor = Get-WmiObject -class win32_processor -computername $server -Credential $credGF
            #$outProcessor = "$($processor.Count)/$($processor.Name[0])"
            $outProcessor = "$($processor.Count)"
            #$processorCount = $processor.Count
            #$processorName = $processor.Name[0]
            $memory = Get-WmiObject Win32_OperatingSystem -ComputerName $server -Credential $credGF
            $outMemory = "$([int]($memory.TotalVirtualMemorySize/1MB))/$([int]($memory.TotalVisibleMemorySize/1MB))"
            #MaxProcessMemorySize
            #$memoryTotal = $memory.TotalVirtualMemorySize
            #$memoryTotalVisible = $memory.TotalVisibleMemorySize

            #Get-WmiObject -class win32_processor -computername $server -Credential $credGF
            $disk = Get-WmiObject Win32_LogicalDisk -ComputerName $server -Credential $credGF
            $outDiskSpace = "c:$([int]($disk[0].Size/1GB))/$([int]($disk[0].FreeSpace/1GB)) d:$([int]($disk[1].Size/1GB))/$([int]($disk[1].FreeSpace/1GB)) e:$([int]($disk[2].Size/1GB))/$([int]($disk[2].FreeSpace/1GB))"
            $certOnServer = Invoke-Command -ComputerName $server -Credential $credGF  -ScriptBlock {Get-ChildItem Cert:\LocalMachine\My}
            $outCertificate = "$($certOnServer.Subject.Split(',')[0].Substring(3))"
            #$outCertificate
        }
        Catch {
            #$disk = $null
        }
        
        #Write-Host "$outProcessor"
        #Write-Host "$outMemory"
        #Write-Host "$outDiskSpace"
            
        if($ID -like "*TDB*") {
            #$instance = $serverGF.$resourceID.instance
            $instance = "$($serverGF.$resourceID.URL),14331"
            $SP_REC = $serverGF.$resourceID.SP_REC
            $PM_SSRS = $serverGF.$resourceID.PM_SSRS
            if($instance -and $SP_REC -and $PM_SSRS) {
                $loginSP_REC = Get-DbaLogin -SqlInstance $instance -Login $SP_REC
                $loginPM_SSRS = Get-DbaLogin -SqlInstance $instance -Login $PM_SSRS
                if($loginSP_REC.Name -and $loginPM_SSRS.Name) {
                    $loginCheck = $true
                    }
                else{
                    $loginCheck = $false
                    }
                $loginCheck
                }
        }
        #}
        #else {
        #    $l = $null
        #}

        #else {
        #    $urlTestResult = ''
        #}
        }
        else {
            $Port80TestResult = 'Down'
            $Port443TestResult = 'Down'
        }

        #$n += 1
        #$l = $n
    }
    else {
    $emptyRow += $i
    }
    
    # -Port 80

$dataOut += [PSCustomObject]@{
#$inData += [PSCustomObject]@{
        #N = $l
        N = $i
        ID = $ID
        Server = $server
        Site = $location
        #'Processor Count/Name' = $outProcessor
        'CPU' = $outProcessor
        'Memory total/visible GB' = $outMemory
        'Drive: capacity/free GB' = $outDiskSpace
        #'D:size/free GB' = $outDiskSpace[1]
        #'E:size/free GB' = $outDiskSpace[2]
        "80 ping" = $Port80TestResult
        "443 ping" = $Port443TestResult
        'Certificate' = $outCertificate
        URL = $url
        "URL ping" = $urlTestResult
        "URL 200" = $StatusCode
        #"ProcID check" = $loginCheck
        "ProcID" = $loginCheck
    }
    #$loginCheck = $null
}

$inData += $dataOut | ConvertTo-Html -Fragment

$inData = $inData.Replace("<td>True", "<td style='background-color:#79F2C0'>Pass")
$inData = $inData.Replace("<td>False", "<td style='background-color:#FF8F73'>Fail")
$inData = $inData.Replace("<td>Down", "<td style='background-color:#FF8F73'>Down")

foreach($one in $emptyRow) {
    #$inData = $inData.Replace("<tr><td>$one", "<tr style='background-color:#79F2C0'><td>$one")
    #$inData = $inData.Replace("<tr><td>$one<", "<tr style='background-color:orange'><td>$one<")
    $inData = $inData.Replace("<tr><td>$one<", "<tr style='background-color:#B3D4FF'><td>$one<")
}

$inData | Out-File $outHTML
Write-Host "Results are Saved to $outHTML"

if($submitConfl) {
### to export pass to file

    ###$cred = Get-Credential XBBNNTG
    ###$pwdFile = 'C:\DataLogs\Confluence\secretFile.txt'
    ###$cred | Export-CliXml -Path $pwdFile

    #Get-ConfluencePage -SpaceKey ~XBBNNTG

    $pwdFile = 'C:\DataLogs\Confluence\secretFile.txt' 
    $cred = Import-CliXml $pwdFile

    #Set-ConfluencePage -apiURi 'https://confluence.bnymellon.net' -PageID $PageID -Body "$inDataTot" -Credential $cred #CRQ Implementation
    Set-ConfluenceInfo -BaseURI 'https://confluence.bnymellon.net' -Credential $cred
    $confInfo = Set-ConfluencePage -PageID $PageID -Body "$inData" -Credential $cred
    $confInfo.Version
}
$currentTime = Get-Date
$timeDiff = ([DateTime]$currentTime - [DateTime]$startTime).TotalSeconds.ToString("0")
Write-Host "Execution time(s): $timeDiff"