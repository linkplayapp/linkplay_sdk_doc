
import os
import shutil
print("*** gf && gr")
os.system("git fetch")
os.system("git reabase")

print("*** Copy from master's _book ***")
os.system("git checkout master -- _book")

target_path = os.getcwd()
book_path = os.path.join(target_path, "_book")
if(os.path.exists(book_path)):
    print("*** Start copy ***")
    for a in os.walk(book_path):
        # 递归创建目录
        for d in a[1]:
            dir_path = os.path.join(a[0].replace(book_path, target_path), d)
            if not os.path.isdir(dir_path):
                # 不存在就创建
                os.makedirs(dir_path)
        # 递归拷贝文件
        for f in a[2]:
            dep_path = os.path.join(a[0], f)  # _book 目录下的每个文件的绝对路径
            arr_path = os.path.join(a[0].replace(
                book_path, target_path), f)  # 每个文件的目标路径
            shutil.copy(dep_path, arr_path)
    print("*** Copy end ***")
    shutil.rmtree('_book')
    print("*** Remove _book ***")
    print("*** Push... ***")
    os.system("git add .")
    os.system("git commit -m 'update'")
    os.system("git push origin gh-pages")
    print("*** Checkout master... ***")
    os.system("git checkout master")
else:
    print("*** _book is not exists*** ")
