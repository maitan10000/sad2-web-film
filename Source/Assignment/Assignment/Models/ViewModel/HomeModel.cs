﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment.Models.ViewModel
{
    public class HomeModel
    {
        public List<Film> MainListFilm { get; set; }
        public List<Film> TopFilm { get; set; }
        public List<Film> NewFilm { get; set; }
        public Account Account { get; set; }
        public List<Category> ListCategory { get; set; }
    }
}