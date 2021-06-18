using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.Model
{
  public class MenuModel
    {

        public int MenuMainId { get; set; }     
        public string MainMenuTittle { get; set; }       
        public string MainMeniController { get; set; }
        public string MainMenuAction { get; set; }
        public Nullable<byte> MainMenuStatus { get; set; }
        public int MenuSubId { get; set; }
        public int RoleId { get; set; }
        public string SubMenuTittle { get; set; }  
        public string SubMenuController { get; set; }
        public string SubMenuAction { get; set; }
        public Nullable<byte> SubMenuStatus { get; set; }

    }
}
