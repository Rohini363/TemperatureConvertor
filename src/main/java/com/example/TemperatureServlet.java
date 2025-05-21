package com.example;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TemperatureServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tempStr = req.getParameter("temperature");
		String unit = req.getParameter("unit");
		System.out.println("Received unit: " + unit);

		double inputTemp = Double.parseDouble(tempStr);
		double resultTemp=0;
		String resultUnit="";
		String inputUnit = "";
		
		if("C".equalsIgnoreCase(unit))
		{
			resultTemp = (inputTemp * 9.0/5.0)+32;
			inputUnit = "Celsius";
			resultUnit = "Fahrenheit";
		}else if("F".equalsIgnoreCase(unit)) {
			resultTemp = (inputTemp - 32)*(5.0/9.0);
			resultUnit = "Celsius";
			inputUnit = "Fahrenheit";
		}
		req.setAttribute("input", inputTemp);
		req.setAttribute("inputUnit", inputUnit);
		resultTemp = Math.round(resultTemp * 100.0) / 100.0;
		req.setAttribute("result", resultTemp);
		req.setAttribute("resultUnit", resultUnit);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    // Redirect to form page or show message
	    response.sendRedirect("index.jsp");
	}

	

}
