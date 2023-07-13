# Домашнее задание к занятию «Основы Terraform. Yandex Cloud - `Мальцев Виктор`

---

Задание 1

В качестве ответа всегда полностью прикладываете ваш terraform-код в git!

    Изучите проект. В файле variables.tf объявлены переменные для yandex provider.
    Переименуйте файл personal.auto.tfvars_example в personal.auto.tfvars. Заполните переменные (идентификаторы облака, токен доступа). Благодаря .gitignore этот файл не попадет в публичный репозиторий. Вы можете выбрать иной способ безопасно передать секретные данные в terraform.
    Сгенерируйте или используйте свой текущий ssh ключ. Запишите его открытую часть в переменную vms_ssh_root_key.
    Инициализируйте проект, выполните код. Исправьте намеренное допущенные ошибки. Ответьте в чем заключается их суть?
    Ответьте, как в процессе обучения могут пригодиться параметрыpreemptible = true и core_fraction=5 в параметрах ВМ? Ответ в документации Yandex cloud.

В качестве решения приложите:

    скриншот ЛК Yandex Cloud с созданной ВМ,
    скриншот успешного подключения к консоли ВМ через ssh,
    ответы на вопросы.

Ответ:

![alt text](https://github.com/vmmaltsev/screenshot3/blob/main/Screenshot_68.png)

![alt text](https://github.com/vmmaltsev/screenshot3/blob/main/Screenshot_69.png)

![alt text](https://github.com/vmmaltsev/screenshot3/blob/main/Screenshot_70.png)

Ответьте в чем заключается их суть?

Некорренто указана версия платформы, v4 не поддерживается Yandex.
Изменено на v1 и изменено количесво ядер процессора, так как v1 не поддерживает 1 ядро.

Ответьте, как в процессе обучения могут пригодиться параметрыpreemptible = true и core_fraction=5 в параметрах ВМ?

preemptible = true - это параметр, который создает "вытесняемую" (preemptible) виртуальную машину. Вытесняемые экземпляры обычно дешевле, но могут быть прерваны и уничтожены системой Yandex.Cloud в любое время, если ресурсы потребуются где-то еще. Это полезно, если вам нужны дополнительные ресурсы для короткого задания или вы хотите сэкономить деньги при тестировании и разработке, где перебои в доступности не так критичны.

core_fraction = 5 - это параметр, который позволяет вам определять процентное использование CPU для виртуальной машины. Этот параметр может быть в диапазоне от 5 до 100. Например, если core_fraction установлен в 5, это означает, что виртуальная машина будет использовать только 5% от полной мощности CPU. Это может быть полезно, если вы хотите сэкономить на затратах на ресурсы, особенно в средах тестирования или разработки, где полная мощность процессора не требуется.

---

Задание 2

    Изучите файлы проекта.
    Замените все "хардкод" значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.
    Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.
    Проверьте terraform plan (изменений быть не должно).

Ответ:

![alt text](https://github.com/vmmaltsev/screenshot3/blob/main/Screenshot_71.png)

---

Задание 3

    Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
    Скопируйте блок ресурса и создайте с его помощью вторую ВМ(в файле main.tf): "netology-develop-platform-db" , cores = 2, memory = 2, core_fraction = 20. Объявите ее переменные с префиксом vm_db_ в том же файле('vms_platform.tf').
    Примените изменения.

Ответ:

![alt text](https://github.com/vmmaltsev/screenshot3/blob/main/Screenshot_72.png)

![alt text](https://github.com/vmmaltsev/screenshot3/blob/main/Screenshot_73.png)

---

Задание 4

    Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.
    Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды terraform output

Ответ:

![alt text](https://github.com/vmmaltsev/screenshot3/blob/main/Screenshot_74.png)

---

Задание 5

    В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с несколькими переменными по примеру из лекции.
    Замените переменные с именами ВМ из файла variables.tf на созданные вами local переменные.
    Примените изменения.

Ответ:

![alt text](https://github.com/vmmaltsev/screenshot3/blob/main/Screenshot_75.png)

---

Задание 6

    Вместо использования 3-х переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объедените их в переменные типа map с именами "vm_web_resources" и "vm_db_resources". В качестве продвинутой практики попробуйте создать одну map переменную vms_resources и уже внутри нее конфиги обеих ВМ(вложенный map).
    Так же поступите с блоком metadata {serial-port-enable, ssh-keys}, эта переменная должна быть общая для всех ваших ВМ.
    Найдите и удалите все более не используемые переменные проекта.
    Проверьте terraform plan (изменений быть не должно).


Ответ:

![alt text](https://github.com/vmmaltsev/screenshot3/blob/main/Screenshot_76.png)

---

Задание 7*

Изучите содержимое файла console.tf. Откройте terraform console, выполните следующие задания:

    Напишите, какой командой можно отобразить второй элемент списка test_list?
    Найдите длину списка test_list с помощью функции length(<имя переменной>).
    Напишите, какой командой можно отобразить значение ключа admin из map test_map ?
    Напишите interpolation выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.

В качестве решения предоставьте необходимые команды и их вывод.

Ответ:

Напишите, какой командой можно отобразить второй элемент списка test_list?
local.test_list[1]

Найдите длину списка test_list с помощью функции length(<имя переменной>).
length(local.test_list)

Напишите, какой командой можно отобразить значение ключа admin из map test_map ?
local.test_map["admin"]

Напишите interpolation выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.
"${local.test_map["admin"]} is admin for production server based on OS ${local.servers["production"].image} with ${local.servers["production"].cpu} vcpu, ${local.servers["production"].ram} ram and ${length(local.servers["production"].disks)} virtual disks"учше




