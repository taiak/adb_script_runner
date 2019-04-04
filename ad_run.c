#include <stdlib.h>
int main()
{
    char command[] = "\
    adb.exe shell \"function uyu() {\
        echo '--> uyku basladi! <--';\
        sleep $1 ;\
        echo '--> uyku bitti! <--';\
    };\
    function tikla() {\
        echo '-> Tiklandi.. <-';\
        input tap 540 1700;\
    };\
    function geri_tusu() {\
        echo '==> geri tusuna basildi <==';\
        input keyevent KEYCODE_BACK;\
    };\
    function apar() {\
        echo '##=> Aparma basladi! <=##';\
        tikla;\
        uyu 33;\
        geri_tusu;\
        uyu 1;\
        tikla;\
        uyu 18;\
        echo '##=> Aparma bitti! <=##';\
    };\
    while true; do apar; done\
    \"";
    system(command);
    return 0;
}
