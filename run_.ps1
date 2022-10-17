git clone --recurse-submodules https://github.com/cobbr/Covenant
git submodule update --init --recursive

# go to repo and run docker command to start up the covenant server
$covenant_path = "C:\Users\abfu003\Documents\tech\covenant\Covenant\Covenant";
$default_location = $pwd
Set-Location $covenant_path;


# docker build  -t c2 .

$data_files = @("covenant.db", "covenant-dev-private.pfx", "covenant-dev-public.cer")
foreach ($file in $data_files) {
    $FileName = "$covenant_path\\Data\\$file"
    if (Test-Path $FileName) {
        Remove-Item $FileName
    }
}

dotnet run

# docker run -d -it -p 7007:7443 -p 7008:80 -p 7003:443 --name covenant -v $covenant_path\\Data:/app/Data covenant;
# docker run -d -it -p 7007:7443 -p 7008:80 -p 7003:443 --name c2 c2;

docker ps  

sleep -s 10 

$test_script_path = "C:\Users\abfu003\Documents\tech\covenant\covenant-ui-test\Selenium_with_python-master\test_scripts"

Set-Location $test_script_path;

# pytest execute_tests.py -vv -s 

# docker stop c2
# docker rm c2

Set-Location $default_location;

#list the ports being listened to and take the highest socket 
# NETSTAT -ant;

