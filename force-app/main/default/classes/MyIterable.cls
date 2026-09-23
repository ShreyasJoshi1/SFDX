public class MyIterable implements Iterable<String>
{
 
// A Private list to hold the Collection of Strings
 
private List<String> strings;
 
// Constructor that intilializes the Class with a given list of Strings
 
public MyIterable(list<string> strings)
 
{
 this.strings = strings;
}
 
// Assigns the Provided list to the Private Variable
 

 
// Implementation of the iterator() method from the Iterable interface
 
    public Iterator<string> iterator(){
 

 
// Returns the iterator of the list object I
 
return strings.iterator();
    }
}