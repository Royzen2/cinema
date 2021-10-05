#include cef


enum Cinema
{
  open,

}
new Cinema_Info[20][Cinema];

public OnGameModeInit()
{
    SetTimer("UpdateTime", 1000*60, 1); // Таймер.
}

public UpdateTime()
{
        new hour, minute, second;
        gettime(hour, minute, second);
        if(hour == 12) // выдается в 12 часов в 0 минут.
        {
                for(new i; i < MAX_PLAYERS; i++)
                {
                  if(IsPlayerRangeOfPoint(i, 27.0, x, y, z)) // x, y, z - координаты зала . ( 27 - радиус )
                  {
                        cef_create_browser(i, 1, "", false, false);
                        new object = CreatePlayerObject(i, x, y, z, 12.0, 0.0, 0.0, 0.0); //x, y, z где распологается обьект куда будет выведено изображение
                        cef_create_ext_browser(i, 1, "CJ_TV_SCREEN", "https://www.youtube.com/embed/-b-LxUjeH40?autoplay=1", 7);
                        cef_append_to_object(i, 1, object); //крепим
                        Cinema_Info[1][open] = 0; //закрываем доступ к зал с номером 1
                  }
                }
        }
        return 1;
}

//Далее в паблике при наступлении на пикап зала один проверяем открыт он или нет
if(Cinema_Info[1][open] != 1)
{
  //ЗАЛ ЗАКРЫТ
}
else
{
  //впускаем людей
}
