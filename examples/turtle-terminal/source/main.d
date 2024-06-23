import turtle;
import textmode;

int main(string[] args)
{
    runGame(new TermExample());
    return 0;
}

class TermExample : TurtleGame
{
    this()
    {

    }

    override void load()
    {
        setBackgroundColor(color("rgba(0, 0, 0, 0%)"));
        console.size(40, 21);
    }

    override void mouseMoved(float x, float y, float dx, float dy)
    {
    }

    int _fontSel = 0;
    int _palSel = 0;

    override void update(double dt)
    {
        if (keyboard.isDown("escape")) exitGame();


            if (keyboard.isDown("space"))
            with(console)
            {
                for (int i = 0; i < 256; ++i)
                {
                    fg(i & 15);
                    bg(cast(ubyte)(i >>> 4));
                    string s;
                    s ~= cast(char)i;
                    print(s);
                }
            }

         {
           
        }
        
         with(console)
         {
            for (int i = 0; i < 1; ++i)
            {
                int col = cast(int) randNormal(80/2, 40);
                int row = cast(int) randNormal(25/2, 12);
                int cfg = (cast(int) randNormal(0, 100)) & 15;
                int cbg = (cast(int) randNormal(0, 100)) & 15;
                if (row >= 20)
                    continue;
                  fg(cfg);
                //  bg(cbg);
                int ch = (cast(int) randNormal(0, 1000)) & 255;   
               // if (ch < 10)
                {
                    locate(col, row);
                    //print(cast(char)ch);
                    cprint("<shiny><white>white</yellow><lblue>lblue</lblue> <lred>red</lred><lgreen>green</lgreen></shiny>");
                }
            }
         }
    }

    int ntimes;
    override void draw()
    {
        ImageRef!RGBA fb = framebuffer();

        with (console)
        {
            TM_Options options;
            options.allowOutCaching = true; // doable because background color is set to transparent
            options.borderColor = 0;
            options.borderShiny = false;
            console.options(options);
            console.palette(TM_Palette.campbell);

            console.outbuf(fb.pixels, fb.w, fb.h, fb.pitch);
            render();
        }
    } 

    TM_Console console;
}

