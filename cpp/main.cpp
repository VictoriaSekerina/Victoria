#include <iostream>
#include <string>
#include <vector>
#include "time.h"
#include "matr.h"

using namespace std;
using namespace massive;
using namespace vect;


int main()
{
    srand(time(NULL));//рандомайзер
    float * m;//Объявление массива
    int n;//переменная размера массива
    float sum_mass;//Переменные для сумм
    float sum_vec;
    vector<float> vec;//Переменная типа vector содержащая вещественные цисла с неопредленным размером
    string s;//Переменная для ввода
    cout << "press 1 - random numbers" << endl;
    cout << "press 2 - numbers from file" << endl;
    cin >> s;
    if (s=="1"){//рандомная генерация массива
        try{
        cin >> s;

        n = stoi(s);//перевод текста в число
        if (n<=0){//Проверка предусловия
        throw std::invalid_argument("");}//Бросаем ошибку, если число <0
        vec.resize(n);//Задаем размер вектору
        m = create_random_mass(n);//вызов функции заполнения массива случанйми числами
        random_vector(vec);//Вызов функции заполнения вектора случайными числами
        } catch (std::invalid_argument e) {//Ловим исключение
            cout << "Error an input"<< endl;
            return 2;
        }
    }else{
        if (s=="2"){//из файла   знаечений из файла
            cout << "enter a file name" << endl;
            cin >> s;//Ввод имени файла
            try {
                   n = open_commands::count_lines(s);//Вызов функции подсчета количества строк в файле
                   cout << "Count string in file " << s << ": " << n;
               } catch (int e) {//ловим исключение
                   cout << "Erorr in file "<< s;
                   return 2;
               }

            vec.resize(n);//Задание размера вектора
            m = new float[n];//Задание рамера массимва
            try{
            for_file_mass::file_input(m,n,s);//Вызов функции заполнения масиива числами из файла
            for_file_vector::file_input(vec,n,s);//Вызов функции заполнения вектора числами из файла
            } catch (std::invalid_argument e) {//Ловим исключение
                cout<<"file is not open or has incorrect content"<<endl;
                return 2;
            }
        }else{
            cout << "Error" << endl;//Если введен неизвестный параметр
        }
    }

    print_massiv(m,n);//вывод массива на экран
    print_vector(vec);
    sum_mass = summ_el_mass(m,n);//подсчеn суммы
    sum_vec = sum_el_vector(vec);
    cout << sum_mass <<endl;//вывод суммы элеменнтов массива
    cout << sum_vec <<endl;
    for_file_mass::file_out(m,n,"file_M.txt","mas");//Вывод Элементов массива и суммы его элементов в файл
    for_file_mass::file_out_num(sum_mass,"file_M.txt","sum");
    for_file_vector::file_out(vec,n,"file_M.txt","vec");
    for_file_vector::file_out_num(sum_vec,"file_M.txt","sum");
    cout << "Output mas to file 'resulMas.txt' comleted"<<endl;
    delete[] m;//очистка памяти
    return 0;
}
