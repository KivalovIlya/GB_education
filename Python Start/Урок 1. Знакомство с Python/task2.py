sec = int(input('Введите кол-во секунд - '))
format_time = '0'
hours = sec // 3600
minutes = sec % 3600 // 60
secundes = sec % 3600 % 60

if hours < 10:
    hours = format_time + str(hours)
if minutes < 10:
    minutes = format_time + str(minutes)
if secundes < 10:
    secundes = format_time + str(secundes)

print(f"{hours}:{minutes}:{secundes}")
