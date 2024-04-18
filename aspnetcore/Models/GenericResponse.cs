namespace WebApplication1.Models;

public class GenericResponse<T> {

	public T Result { get; set; }
	public string Message { get; set; }
	public int StatusCode { get; set; }
	
}