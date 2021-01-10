#include <iostream>
#include <vector>
#include <fstream>
#include <string>

using namespace std;
namespace massive {
//Функция создания рандомного массива
float* create_random_mass(unsigned n){
    float*m = new float[n];
    for (unsigned i=0; i<n;i++){
        m[i]= rand()%5;
    }
    return m;

}
//Функция печати массива
void print_massiv(float*m,unsigned n){
    for (unsigned i=0; i<n;i++){
        cout << m[i]<<' ';
    }
    cout << endl;

}
//Функция суммы элементов массива
float summ_el_mass(float*m,unsigned n){
    int sum = 0;
    for (unsigned i=0; i<n;i++){
        sum += m[i];
    }
    return sum;

}
}
namespace  vect{
//фугкция заполнения вестора случаными значениями
void random_vector(vector<float> &v){
    for (unsigned i=0;i<v.size();i++){
        v[i] = (rand()%100)/10;
    }
}
//Функция подсчета суммыэлементов вектора
float sum_el_vector(vector<float> &v){
    float summ =0;
    for (unsigned i=0;i<v.size();i++){
        summ +=v[i];
    }
    return summ;
}
//Функция вывода вктора на экран
void print_vector(vector<float> &v){
    for (unsigned i=0;i<v.size();i++){
        cout << v[i]<< ' ';
    }
    cout <<endl;
}
}
namespace for_file_mass {
//Фугкция вывода массива в файл
void file_out(float* m,unsigned n, string s, string comment = ""){
    ofstream out;
    out.open(s);
    if (out.is_open()){
        out << comment <<endl;
        for (unsigned i=0;i<n;i++){
            out << m[i] << " ";
        }
    }else {
        out.close();
        throw std::invalid_argument("");
    }
    out.close();
}
//Функция вывода числа в файл
void file_out_num(float num,string s,string comment = ""){
    ofstream out;
    out.open(s,ios_base::app);
    if (out.is_open()){
        out << comment<<endl<< num << endl;

    }else {
        out.close();
        throw std::invalid_argument("");
    }
    out.close();
}
//Функция получения массива из файла
void file_input(float* m,unsigned n,const string &filename){
    string line;
    ifstream f(filename);
    cout << filename<<endl;
    if (f.is_open()){
        for(unsigned i =0;i<n;i++){
            getline(f, line);

            m[i] = stof(line);
        }
    }
    else {
        f.close();
        throw std::invalid_argument("");
    }
    f.close();
}


}
namespace for_file_vector {
//Вывод вектора в файл
void file_out(vector<float> vec,unsigned n, string s,string comment =""){
    ofstream out;
    out.open(s);
    if (out.is_open()){
        out << comment <<endl;
        for (unsigned i=0;i<n;i++){
            out << vec[i] << " ";
        }
    }
    else {
        out.close();
        throw std::invalid_argument("");
    }
    out.close();
}
//Вывод файла числа в файл
void file_out_num(float num,string s,string comment =""){
    ofstream out;
    out.open(s);
    if (out.is_open()){
        out << comment <<endl<<num << endl;
    }
    else {
        out.close();
        throw std::invalid_argument("");
    }
    out.close();
}
//получение вектора из файла
void file_input(vector<float> &vec,unsigned n,const string &filename){
    string line;
    ifstream f(filename);
    cout << filename<<endl;
    if (f.is_open()){
        for(unsigned i =0;i<n;i++){
            getline(f, line);
            vec[i] = stof(line);
        }
    }
    else{
        f.close();
        throw std::invalid_argument("");
    }
    f.close();
}
}
namespace  open_commands{
//Количество строк в файле
unsigned count_lines(const string &filename){
    string line;
    ifstream f(filename);
    if (f.is_open()){
        unsigned n = 0;
        while(std::getline(f, line))
            n++;
        return n;}
    else throw std::invalid_argument("");
}
//проуека, что строка - число
bool num_checker(string s){
    string con = "1234567890";
    bool f;

    for (unsigned i = 0;i<s.length();i++){
        f=false;
        for (unsigned j = 0;j<10;j++){
            if(s[i]==con[j]){
               f= true;
            }
        }
        if (f==false){
            return false;
        }
    }
    return true;

}
}
