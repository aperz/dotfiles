/*
Prints some summarisations for a given matrix
*/

#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

int main()
{
//    std::ifstream infile("/dat2/tiny_SRA.tsv");
    std::ifstream infile("~/dat2/testmatrix.tsv");
    std::string line;
    while (std::getline(infile, line))
    {
        cout << line << endl;
        istringstream iss(line);
        double value;
        std::vector<double> v;
        while (iss)
        {
            iss >> value;
            v.push_back(value);
            //string val;
            //iss >> val;
            //int val_int;
            //val_int = std::stoi ("17");
            //cout << value << endl;
            }
        cout << v << endl;
        }
        return 0;
    }
