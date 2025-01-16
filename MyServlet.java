package myPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MyServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Retrieve parameters
        String str1 = request.getParameter("num1");
        String str2 = request.getParameter("num2");
        String str3 = request.getParameter("btn1");
        
        // Check if parameters are null or empty
        if (str1 == null || str1.isEmpty() || str2 == null || str2.isEmpty()) {
            response.getWriter().append("Invalid Numbers");
            return; 
        }

        try {
            // Convert to integers
            int num1 = Integer.parseInt(str1);
            int num2 = Integer.parseInt(str2); 
            
            // Compute operations
            int ans = 0;
            String operator = "";
            if (str3.equals("1")) {
                ans = num1 + num2;
                operator = "+";
            } else if (str3.equals("2")) {
                ans = num1 - num2;
                operator = "-";
            } else if (str3.equals("3")) {
                ans = num1 * num2;
                operator = "*";
            } else if (str3.equals("4")) {
                if (num2 != 0) {
                    ans = num1 / num2;
                    operator = "/";
                } else {
                    response.getWriter().append("Error: Division by zero.");
                    return;
                }
            }

            // Save history to session
            HttpSession session = request.getSession();
            ArrayList<String> history = (ArrayList<String>) session.getAttribute("history");
            if (history == null) {
                history = new ArrayList<>();
            }

            String entry = num1 + " " + operator + " " + num2 + " = " + ans;
            history.add(entry);
            session.setAttribute("history", history);

            // Redirect with result
            response.sendRedirect("index.jsp?ans=" + ans);

        } catch (NumberFormatException e) {
            response.getWriter().append("Error: Invalid number format. Please enter valid integers.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
