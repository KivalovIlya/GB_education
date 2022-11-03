def looting(materials, capacity):
    relation = []
    print(f"{materials} - материалы деревни")
    for i in materials:
        relation.append(i/min(materials))
    print(f"{relation} - отношения материалов")
    one_piece = capacity/sum(relation)
    for i in range(len(relation)):
        relation[i] = round(relation[i] * one_piece)
    while sum(relation) != capacity:
        relation[relation.index(max(relation))] = max(relation) - 1
    print(f"{relation} - сколько материалов берет армия")
    print(f"{sum(relation)} - сумма награбленного")


materials = [12, 732, 275, 40, 200, 540, 402]
capacity = 222

looting(materials, capacity)