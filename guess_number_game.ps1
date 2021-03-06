# Игра "Отгадай число"
# Версия 1.0
function guess_number_game {
cls
write-host "Угадай число v1.0"
write-host "-----------------"
write-host "Я загадал число от 1 до 100. Постарайтесь отгадать его за минимальное число попыток."
$number= get-random -minimum 1 -maximum 101
write-host ""
while ($true)
{
    try 
        {[int]$guess = read-host "Введите ваше предположение: " 
        if ($guess -gt 0 -and $guess -le 100 ) 
            { break } 
        else 
            {write-host "Нужно ввести число от 1 до 100!"}
}
    catch [system.exception] 
        {write-host "Нужно ввести число от 1 до 100!"}
}
$tries = 1
while ($guess -ne $number)
{
    if ($guess -gt $number) 
        {write-host "Меньше..."} 
    else  
        {write-host "Больше..."}
    while ($true)
    {
        try 
            {[int]$guess = read-host "Введите ваше предположение: " 
            if ($guess -gt 0 -and $guess -le 100 ) 
                { break } 
            else 
                {write-host "Нужно ввести число от 1 до 100!"}}
        catch [system.exception] {write-host "Нужно ввести число от 1 до 100!"}  
    }
$tries += 1 
}       
write-host ""
write-host "===ПОЗДРАВЛЯЕМ==="
write-host "Вам удалось отгадать число. Это действительно" $number 
write-host "Количество попыток:" $tries 
write-host ""
$answer = read-host "Чтобы переиграть, введите R. Для выхода из игры нажмите Enter"
if ($answer.ToUpper() -eq "R") 
    {guess_number_game}
else
    {exit}
}
guess_number_game 
