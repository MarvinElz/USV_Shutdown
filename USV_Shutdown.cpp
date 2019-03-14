#include <iostream>
#include <wiringPi.h>

#include <unistd.h> // usleep

using namespace std;

int main(){
	cout << "Shutdown gestartet" << endl;
	
	// wiringpi Init
	wiringPiSetup();
	
	#define SHUTDOWN_PIN 29
	
	pinMode ( SHUTDOWN_PIN, INPUT);
	
	pullUpDnControl( SHUTDOWN_PIN, PUD_DOWN );
	
	bool WideInput = false;
	
	while(true){
		
		if( digitalRead (SHUTDOWN_PIN) == HIGH ){
			cout << "Input high" << endl;
			WideInput = true;
		}else{
			//cout << "Input low" << endl;
			if( WideInput ){	// nur Herunterfahren, wenn der Wide-INput jemals angeschlossen war
				usleep(500000);	// halbe Sekunde später nochmal checken, um sicher zu sein
				if( digitalRead( SHUTDOWN_PIN ) == LOW ){
					cout << "sudo shutdown -h now" << endl;
					system("sudo shutdown -h now");
				}
			}
		}
		
		usleep(10000);
	}
}
