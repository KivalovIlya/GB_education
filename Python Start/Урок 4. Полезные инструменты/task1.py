from sys import argv

name_script, work_hours, pay_hour, bonus = argv


def calc_pay(work_hours, pay_hour, bonus):
    try:
        print(int(work_hours) * int(pay_hour) + int(bonus))
    except ValueError:
        print("Вводить необходимо только числа!")


calc_pay(work_hours, pay_hour, bonus)