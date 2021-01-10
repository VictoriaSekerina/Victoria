#ifndef MATR_H
#define MATR_H

#include <vector>
#include <string>
using namespace std;
namespace massive {
//Функция создания рандомного массива
float* create_random_mass(unsigned n);
//Функция печати массива
void print_massiv(float*m,unsigned n);
//Функция суммы элементов массива
float summ_el_mass(float*m,unsigned n);
}
namespace  vect{
//фугкция заполнения вестора случаными значениями
void random_vector(vector<float> &v);
//Функция подсчета суммыэлементов вектора
float sum_el_vector(vector<float> &v);
//Функция вывода вктора на экран
void print_vector(vector<float> &v);
}
namespace for_file_mass {
//Фугкция вывода массива в файл
void file_out(float* m,unsigned n, string s, string comment = "");
//Функция вывода числа в файл
void file_out_num(float num,string s,string comment = "");
//Функция получения массива из файла
void file_input(float* m,unsigned n,const string &filename);
}
namespace for_file_vector {
//Вывод вектора в файл
void file_out(vector<float> vec,unsigned n, string s,string comment ="");
//Вывод файла числа в файл
void file_out_num(float num,string s,string comment ="");
//получение вектора из файла
void file_input(vector<float> &vec,unsigned n,const string &filename);
}
namespace  open_commands{
//Количество строк в файле
unsigned count_lines(const string &filename);
//проуека, что строка - число
bool num_checker(string s);
}



#endif // MATR_H
