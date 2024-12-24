def f():
    try:
        print(1)
        return 3
    except:
        print(2)
        return 6

print(f())