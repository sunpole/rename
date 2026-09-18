# Транслитерация русских букв в латиницу
$translit = @{
    'а'='a'; 'б'='b'; 'в'='v'; 'г'='g'; 'д'='d'; 'е'='e'; 'ё'='yo'; 'ж'='zh'; 'з'='z';
    'и'='i'; 'й'='y'; 'к'='k'; 'л'='l'; 'м'='m'; 'н'='n'; 'о'='o'; 'п'='p'; 'р'='r';
    'с'='s'; 'т'='t'; 'у'='u'; 'ф'='f'; 'х'='kh'; 'ц'='ts'; 'ч'='ch'; 'ш'='sh'; 'щ'='shch';
    'ъ'='';  'ы'='y'; 'ь'='';  'э'='e'; 'ю'='yu'; 'я'='ya';
    'А'='A'; 'Б'='B'; 'В'='V'; 'Г'='G'; 'Д'='D'; 'Е'='E'; 'Ё'='Yo'; 'Ж'='Zh'; 'З'='Z';
    'И'='I'; 'Й'='Y'; 'К'='K'; 'Л'='L'; 'М'='M'; 'Н'='N'; 'О'='O'; 'П'='P'; 'Р'='R';
    'С'='S'; 'Т'='T'; 'У'='U'; 'Ф'='F'; 'Х'='Kh'; 'Ц'='Ts'; 'Ч'='Ch'; 'Ш'='Sh'; 'Щ'='Shch';
    'Ъ'='';  'Ы'='Y'; 'Ь'='';  'Э'='E'; 'Ю'='Yu'; 'Я'='Ya'
}

$files = Get-ChildItem -File

foreach ($file in $files) {
    $base = $file.BaseName
    $ext  = $file.Extension
    $newBase = $base

    foreach ($key in $translit.Keys) {
        $newBase = $newBase -replace $key, $translit[$key]
    }

    $newBase = $newBase -replace ' ', '_'

    $newName = $newBase + $ext

    if ($newName -ne $file.Name) {
        Rename-Item -Path $file.FullName -NewName $newName
        Write-Host "Переименован: '$($file.Name)' -> '$newName'"
    }
}
