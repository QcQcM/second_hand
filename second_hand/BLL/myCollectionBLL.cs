using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace second_hand.BLL
{
    public class myCollectionBLL
    {
        public List<Model.Release> selecMyCollection(String userID)
        {
            DAL.myCollectionDAO mcn = new DAL.myCollectionDAO();
            return mcn.selecMyCollection(userID);
        }
    }
}