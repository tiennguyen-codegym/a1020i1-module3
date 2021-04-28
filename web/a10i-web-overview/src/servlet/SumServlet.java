package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SumServlet", urlPatterns = "/sumAbc")
public class SumServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int a = Integer.parseInt(request.getParameter("numberOne"));
        int b = Integer.parseInt(request.getParameter("numberTwo"));
        int total = a + b;

        request.setAttribute("total2Num", total);
        request.getRequestDispatcher("result.jsp").forward(request, response);
//        response.sendRedirect("result.jsp");

        // C1
//        PrintWriter printWriter = response.getWriter();
//        printWriter.write("<html>");
//        printWriter.write("<head>");
//        printWriter.write("</head>");
//        printWriter.write("<body>");
//        printWriter.write("<p style='color: red'>" + total + "</p>");
//        printWriter.write("</body>");
//        printWriter.write("</html>");

    }
}
