start_km = int(input("Начальная дистанция - "))
finish_km = int(input("Цель - "))
day_count = 1

while start_km < finish_km:
    start_km = start_km + start_km/10
    day_count = day_count + 1

print(day_count)