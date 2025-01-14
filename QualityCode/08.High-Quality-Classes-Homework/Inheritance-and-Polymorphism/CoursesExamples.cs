﻿namespace InheritanceAndPolymorphism
{
    using System;
    using System.Collections.Generic;

    public class CoursesExamples
    {
        public static void Main()
        {
            var localCourse = new LocalCourse("Databases");
            Console.WriteLine(localCourse);

            localCourse.Lab = "Enterprise";
            Console.WriteLine(localCourse);

            localCourse.Students = new List<string> { "Peter", "Maria" };
            Console.WriteLine(localCourse);

            localCourse.TeacherName = "Svetlin Nakov";
            localCourse.Students = new[] { "Milena", "Todor" };
            Console.WriteLine(localCourse);

            var offsiteCourse = new OffsiteCourse(
                "PHP and WordPress Development", 
                "Mario Peshev",
                new List<string> { "Thomas", "Ani", "Steve" });
            Console.WriteLine(offsiteCourse);
        }
    }
}
