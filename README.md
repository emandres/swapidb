# Thinking Like a Database

## What is SWAPI?

SWAPI stands for a Star Wars API, an online, open source database of facts about the Star Wars universe. This exercise uses a database derived from the fixtures available in the [git repository](https://github.com/phalt/swapi).

## Exercises

The objective of this exercise is to help you understand the operations a database must do when performing queries. A web project is provided that allows you limited ability to browse the tables in the database.

### Exercise 1.1 - Orphans of Alderaan

Following Alderaan was destroyed by the Empire, many people were left without a homeworld. Find the names of all the people from the planet Alderaan.

Hint: If you were writing a SQL query find the answer, you might write something like the following:

<pre>
select 
    person.Name
from Planets planet
    join People person on planet.Id = person.Homeworld
where planet.Name = 'Alderaan'
</pre>

### Exercise 1.2 Orphans of Alderaan, revisited

What you just performed is known as a table scan. It's the equivalent of looking through a phone book for a specific number. It sure would be nice if you had the data organized in a better way to perform this query.
Reload the People page. You now have access to the "By Homeworld" index. Repeat exercise 1.1, using the index.
