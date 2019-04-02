
class WereWolf
    attr_reader :command

    def initialize(x, y, ad_time = 33, whell_time = 18)
        set_time(ad_time, whell_time)
        prepare_command(x, y)
    end

    def set_time(ad_time, spin_time)
        @ad_time, @spin_time = ad_time, spin_time
    end

    def start(count=:inf)
        if count == :inf
            loop{ adb_shell_run}
        else count > 0
            1.upto(count.to_i) do |i|
                puts "######## ==> #{i}. aparma <== ########" 
                adb_shell_run 
            end
        end
    end

    private 
    def prepare_command(x, y)
        @command = "
        function uyu() {
            echo '--> uyku basladi! <--'
            sleep $1    
            echo '--> uyku bitti! <--'
        }
        function tikla() {
            echo '-> Tiklandi.. <-'
            input tap #{x} #{y}
        }
        function geri_tusu() {
            echo '==> geri tusuna basildi <=='
            input keyevent KEYCODE_BACK
        }
        function apar() {
            echo '##=> Aparma basladi! <=##'
            tikla
            uyu #{@ad_time}
            geri_tusu
            uyu 1
            tikla
            uyu #{@spin_time}
            echo '##=> Aparma bitti! <=##'
        }
        apar
        "
    end

    def adb_shell_run
        system(".\adb.exe", "shell", @command)
    end
end


w = WereWolf.new(540, 1700)
p w.command
# w.start 2