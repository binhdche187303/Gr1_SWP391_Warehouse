/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.User;

/**
 *
 * @author Huy Nam
 */
public class RoleFilter implements Filter {

    private static final Map<Integer, List<String>> rolePermissions = new HashMap<>();

    static {
        rolePermissions.put(2, Arrays.asList("/home", "/profileSetting", "/login", "/count-cart", "/remove-cart", "/update-cart", "/update-cart2", "/check-stock", "/remove-cart", "/shop", "/shopDetails", "/cart", "/checkout", "/logout", "/customerOrderDetail", "/changeprofile", "/changepassword", "/customer-order", "/ajaxServlet", "/vnpayReturn", "/error", "/confirm-order", "/logout"));
        rolePermissions.put(1, Arrays.asList("/dashboard", "/changepasswordemail", "/financialmanagement", "/allusers", "/allstaff", "/createstaff", "/productlist", "/createproductgeneral", "/createproductimg", "/createproductvariants", "/role", "/couponlist", "/createcoupon", "/listdiscounthistory",
                "/couponproductlist", "/createcouponproduct", "/discountproductdetail", "/productdetail", "/brandlist", "/createbrand", "/categorylist", "/createcategory", "/sizelist", "/createsize", "/profilesettingadmin", "/logout", "/error"));
        rolePermissions.put(3, Arrays.asList("/orderlist", "/changepasswordemail", "/order-details", "/inventory-checklist", "/inventory-checklist-detail", "/importGood", "/importGoodDetail", "/handleImport", "/create-inventory-check", "/supplier", "/editSupplier", "/archive", "/editWarehouse",
                "/managerDashboard", "/getSuppliers", "/allstaff", "/getArchive", "/productbrand", "/apply-discount", "/manager-confirmOrder", "/logout", "/error", "/manager/mng_add_inventory_form.jsp", "/exportInventoryCheck"));
        rolePermissions.put(4, Arrays.asList("/staff-checklist", "/changepasswordemail", "/staff-checklist-details", "/inventory-checklist-detail", "/product-warehouse", "/logout", "/complete-inventory-check", "/error"));
        rolePermissions.put(5, Arrays.asList("/my-packing-orders","/profilesettingpacking", "/changepasswordemail", "/orderPackingDetail", "/exportInvoice", "/packing-orders", "/confirmPackingServlet", "/assignPackingOrder", "/logout", "/error"));
        rolePermissions.put(7, Arrays.asList("/sale-orders", "/changepasswordemail", "/my-sale-orders", "/browse-cus", "/orderSaleDetail", "/assignSaleOrder", "/confirmSale", "/getOrderNote", "/logout", "/error"));
        rolePermissions.put(6, Arrays.asList("/ship-orders", "/changepasswordemail", "/my-shipping-orders", "/orderShippingDetail", "/assignShippingOrder", "/confirmShippingServlet", "/logout", "/error"));
    }

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public RoleFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("RoleFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("RoleFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("RoleFilter:doFilter()");
        }

        doBeforeProcessing(request, response);
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        User acc = (User) session.getAttribute("acc");
        String uri = req.getRequestURI().replace(req.getContextPath(), "");
        String fullURL = req.getRequestURL().toString(); // Lấy URL đầy đủ
        String requestURI = req.getRequestURI();

        if (requestURI.startsWith(req.getContextPath() + "/assets/")
                || requestURI.startsWith(req.getContextPath() + "/assets2/")) {
            chain.doFilter(request, response);
            return;
        }
        // ✅ BỎ QUA FILTER nếu URL chứa sandbox.vnpayment.vn (Thanh toán VNPAY)
        if (fullURL.contains("sandbox.vnpayment.vn") || uri.contains("/paymentv2/Transaction/PaymentMethod.html")) {
            chain.doFilter(request, response);
            return;
        }
        if (acc == null) {

            if (//Customer
                    uri.equals("/customer-order")
                    || uri.equals("/checkout")
                    || uri.equals("/check-stock")
                    || uri.equals("/update-cart")
                    || uri.equals("/update-cart2")
                    || uri.equals("/remove-cart")
                    || uri.equals("/count-cart")
                    || //Manager
                    uri.equals("/getSuppliers")
                    || uri.equals("/allstaff")
                    || uri.equals("/getArchive")
                    || uri.equals("/handleImport")
                    || uri.equals("/importGood")
                    || uri.equals("/productbrand")
                    || uri.equals("/apply-discount")
                    || uri.equals("/manager-confirmOrder")
                    || uri.equals("/ajaxServlet")
                    //Packing
                    || uri.equals("/confirmPackingServlet")
                    //Seller
                    || uri.equals("/confirmSale")
                    || uri.equals("/getOrderNote")

                    || //Staff
                    uri.equals("/product-warehouse")
                    || uri.equals("/staff-checklist")
                    || uri.equals("/complete-inventory-check")) {
                chain.doFilter(request, response);
                return;
            }

            if (!(uri.equals("/home")
                    || uri.equals("/login")
                    || uri.equals("/changepasswordemail")
                    || uri.equals("/register")
                    || uri.equals("/request")
                    || uri.equals("/shop")
                    || uri.equals("/reset"))) {
                res.sendRedirect(req.getContextPath() + "/login");
                return;
            }

        } else if (acc.getRole() != null) {
            int roleId = acc.getRole().getRoleId();
            List<String> allowedPages = rolePermissions.get(roleId);

            // Nếu role có danh sách trang được phép và trang hiện tại không có trong danh sách
            if (allowedPages != null && !allowedPages.contains(uri)) {
                res.sendRedirect("/Gr1_Warehouse/error"); // Chặn truy cập
                return;
            }
        }

        Throwable problem = null;
        try {
            chain.doFilter(request, response);
        } catch (Throwable t) {
            // If an exception is thrown somewhere down the filter chain,
            // we still want to execute our after processing, and then
            // rethrow the problem after that.
            problem = t;
            t.printStackTrace();
        }

        doAfterProcessing(request, response);

        // If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("RoleFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("RoleFilter()");
        }
        StringBuffer sb = new StringBuffer("RoleFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
