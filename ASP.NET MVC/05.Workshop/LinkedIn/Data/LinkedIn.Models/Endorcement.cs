﻿namespace LinkedIn.Models
{
    using System.ComponentModel.DataAnnotations;

    public class Endorcement
    {
        public int Id { get; set; }

        [Required]
        public string UserId { get; set; }

        public virtual User User { get; set; }

        public int SkillId { get; set; }

        public virtual UserSkill UserSkill { get; set; }
    }
}
