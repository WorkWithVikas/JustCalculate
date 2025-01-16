package myPackage; 

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ClearHistoryServlet")
public class ClearHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ClearHistoryServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("history"); // Clear the history
        response.sendRedirect("index.jsp"); // Redirect back to main page
    }
}
