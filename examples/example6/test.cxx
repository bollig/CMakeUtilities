#include<iostream>
#include<string>

using namespace std;

void hello(string);
void goodbye();

int main (int argc, char** argv) {

	if (argc > 1) {
		hello(argv[1]);
	} else {
		goodbye();
		return 1;
	}
	return 0;
}
