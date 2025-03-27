/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package dashboardController;

import dao.StatisticDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import model.TransactionRecord;

/**
 *
 * @author admin
 */
public class FinancialManagement extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FinancialManagement</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FinancialManagement at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StatisticDAO sd = new StatisticDAO();
        String timePeriodStr = request.getParameter("timePeriod");
        Integer timePeriod = null;
        BigInteger totalRevenue = BigInteger.ZERO;
        BigInteger totalCost = BigInteger.ZERO;
        List<TransactionRecord> listTransactionRecord = new ArrayList<>();

        totalRevenue = sd.getAllTimeRevenue();
        totalCost = sd.getAllTimeCost();
        listTransactionRecord = sd.getAllTransactions();

        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("totalCost", totalCost);
        request.setAttribute("listTransactionRecord", listTransactionRecord);

        request.getRequestDispatcher("/dashboard/financial_management.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StatisticDAO sd = new StatisticDAO();
        String timePeriodStr = request.getParameter("timePeriod");
        Integer timePeriod = null;
        BigInteger totalRevenue = BigInteger.ZERO;
        BigInteger totalCost = BigInteger.ZERO;
        List<TransactionRecord> listTransactionRecord = new ArrayList<>();
        if (timePeriodStr != null && !timePeriodStr.isEmpty() && !timePeriodStr.equals("all")) {
            try {
                timePeriod = Integer.parseInt(timePeriodStr);
                totalRevenue = sd.getTotalRevenue(timePeriod);
                totalCost = sd.getTotalCost(timePeriod);
                listTransactionRecord = sd.getTransactionsByDate(timePeriod);
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        } else {
            totalRevenue = sd.getAllTimeRevenue();
            totalCost = sd.getAllTimeCost();
            listTransactionRecord = sd.getAllTransactions();
        }

        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("totalCost", totalCost);
        request.setAttribute("listTransactionRecord", listTransactionRecord);

        request.getRequestDispatcher("/dashboard/financial_management.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
