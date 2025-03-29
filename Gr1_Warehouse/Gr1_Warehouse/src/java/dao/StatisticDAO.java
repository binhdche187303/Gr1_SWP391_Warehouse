/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.TransactionRecord;

/**
 *
 * @author admin
 */
public class StatisticDAO extends DBContext {

    public BigInteger getTotalRevenue(Integer days) {
        BigInteger totalRevenue = BigInteger.ZERO;
        String sql = "SELECT SUM(\n"
                + "    CASE \n"
                + "        WHEN TRIM(p.payment_status) LIKE '%thanh toán 100%' THEN o.total_amount\n"
                + "        WHEN TRIM(p.payment_status) = 'Thanh toán 50%' THEN o.total_amount * 0.5\n"
                + "        ELSE 0 \n"
                + "    END\n"
                + ") AS thu\n"
                + "FROM Orders o\n"
                + "LEFT JOIN Payment p ON o.order_id = p.order_id\n"
                + "WHERE o.order_date >= DATEADD(day, -?, GETDATE())";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if (days != null) {
                ps.setInt(1, days);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                BigDecimal revenue = rs.getBigDecimal("thu");
                if (revenue != null) {
                    totalRevenue = revenue.toBigInteger();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRevenue;
    }

    public BigInteger getTotalCost(Integer days) {
        BigInteger totalCost = BigInteger.ZERO;
        String sql = "SELECT SUM(total_amount) AS chi\n"
                + "FROM PurchaseOrder\n"
                + "WHERE order_date >= DATEADD(day, -?, GETDATE())";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if (days != null) {
                ps.setInt(1, days);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                BigDecimal cost = rs.getBigDecimal("chi");
                if (cost != null) {
                    totalCost = cost.toBigInteger();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalCost;
    }

    public BigInteger getAllTimeRevenue() {
        BigInteger totalRevenue = BigInteger.ZERO;
        String sql = "SELECT SUM(\n"
                + "    CASE \n"
                + "        WHEN TRIM(p.payment_status) LIKE '%thanh toán 100%' THEN o.total_amount\n"
                + "        WHEN TRIM(p.payment_status) = 'Thanh toán 50%' THEN o.total_amount * 0.5\n"
                + "        ELSE 0 \n"
                + "    END\n"
                + ") AS total_revenue\n"
                + "FROM Orders o\n"
                + "LEFT JOIN Payment p ON o.order_id = p.order_id";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                BigDecimal revenue = rs.getBigDecimal("total_revenue");
                if (revenue != null) {
                    totalRevenue = revenue.toBigInteger();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRevenue;
    }

    public BigInteger getAllTimeCost() {
        BigInteger totalCost = BigInteger.ZERO;
        String sql = "SELECT SUM(total_amount) AS total_cost\n"
                + "FROM PurchaseOrder";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                BigDecimal cost = rs.getBigDecimal("total_cost");
                if (cost != null) {
                    totalCost = cost.toBigInteger();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalCost;
    }

//Phieu thu chi
    public List<TransactionRecord> getAllTransactions() {
        List<TransactionRecord> transactions = new ArrayList<>();

        String sql = "SELECT \n"
                + "    CASE \n"
                + "        WHEN p.payment_id IS NOT NULL THEN N'Phiếu Thu' \n"
                + "        WHEN po.order_id IS NOT NULL THEN N'Phiếu Chi'\n"
                + "    END AS 'type',\n"
                + "    \n"
                + "    CASE \n"
                + "        WHEN p.payment_id IS NOT NULL AND p.payment_status = N'Thanh toán 50%' THEN N'Thu tiền khách cọc 50%'\n"
                + "        WHEN p.payment_id IS NOT NULL AND (p.payment_status LIKE N'%thanh toán 100%' OR p.payment_status = N'Đã thanh toán 100%') THEN N'Thu tiền khách trả đầy đủ'\n"
                + "        WHEN po.order_id IS NOT NULL THEN N'Nhập kho'\n"
                + "    END AS 'reason',\n"
                + "    \n"
                + "    COALESCE(p.payment_date, po.order_date) AS 'date',\n"
                + "    \n"
                + "    u.fullname AS 'createdBy',\n"
                + "    \n"
                + "    CASE\n"
                + "        WHEN p.payment_id IS NOT NULL AND p.payment_status = N'Thanh toán 50%' THEN o.total_amount * 0.5\n"
                + "        WHEN p.payment_id IS NOT NULL AND (p.payment_status LIKE N'%thanh toán 100%' OR p.payment_status = N'Đã thanh toán 100%') THEN o.total_amount\n"
                + "        WHEN po.order_id IS NOT NULL THEN po.total_amount\n"
                + "    END AS 'amount',\n"
                + "    \n"
                + "    CASE\n"
                + "        WHEN p.payment_id IS NOT NULL THEN o.order_id\n"
                + "        WHEN po.order_id IS NOT NULL THEN po.order_id\n"
                + "    END AS 'referenceId'\n"
                + "    \n"
                + "FROM \n"
                + "    Payment p\n"
                + "    FULL OUTER JOIN PurchaseOrder po ON 1=0\n"
                + "    LEFT JOIN Orders o ON p.order_id = o.order_id\n"
                + "    LEFT JOIN Users u ON (o.user_id = u.user_id OR po.user_id = u.user_id)\n"
                + "    LEFT JOIN Suppliers sup ON po.supplier_id = sup.supplier_id\n"
                + "    LEFT JOIN (SELECT order_id, customer_name FROM Orders) cust ON o.order_id = cust.order_id\n"
                + "WHERE \n"
                + "    (p.payment_id IS NOT NULL AND (p.payment_status LIKE N'%thanh toán 100%' OR p.payment_status = N'Đã thanh toán 100%' OR p.payment_status = N'Thanh toán 50%'))\n"
                + "    OR\n"
                + "    (po.order_id IS NOT NULL)\n"
                + "ORDER BY COALESCE(p.payment_date, po.order_date) DESC;";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TransactionRecord transaction = new TransactionRecord();
                transaction.setType(rs.getString("type"));
                transaction.setReason(rs.getString("reason"));
                transaction.setDate(rs.getTimestamp("date"));
                transaction.setAmount(rs.getBigDecimal("amount"));
                transaction.setReferenceId(rs.getInt("referenceId"));
                transaction.setCreatedBy(rs.getString("createdBy"));

                transactions.add(transaction);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return transactions;
    }

    //Phieu thu chi theo ngay
    public List<TransactionRecord> getTransactionsByDate(Integer days) {
        List<TransactionRecord> transactions = new ArrayList<>();
        BigInteger totalRevenue = BigInteger.ZERO;
        String sql = "SELECT \n"
                + "    CASE \n"
                + "        WHEN p.payment_id IS NOT NULL THEN N'Phiếu Thu' \n"
                + "        WHEN po.order_id IS NOT NULL THEN N'Phiếu Chi'\n"
                + "    END AS 'type',\n"
                + "    \n"
                + "    CASE \n"
                + "        WHEN p.payment_id IS NOT NULL AND p.payment_status = N'Thanh toán 50%' THEN N'Thu tiền khách cọc 50%'\n"
                + "        WHEN p.payment_id IS NOT NULL AND (p.payment_status LIKE N'%thanh toán 100%' OR p.payment_status = N'Đã thanh toán 100%') THEN N'Thu tiền khách trả đầy đủ'\n"
                + "        WHEN po.order_id IS NOT NULL THEN N'Nhập kho'\n"
                + "    END AS 'reason',\n"
                + "    \n"
                + "    COALESCE(p.payment_date, po.order_date) AS 'date',\n"
                + "    \n"
                + "    u.fullname AS 'createdBy',\n"
                + "    \n"
                + "    CASE\n"
                + "        WHEN p.payment_id IS NOT NULL AND p.payment_status = N'Thanh toán 50%' THEN o.total_amount * 0.5\n"
                + "        WHEN p.payment_id IS NOT NULL AND (p.payment_status LIKE N'%thanh toán 100%' OR p.payment_status = N'Đã thanh toán 100%') THEN o.total_amount\n"
                + "        WHEN po.order_id IS NOT NULL THEN po.total_amount\n"
                + "    END AS 'amount',\n"
                + "    \n"
                + "    CASE\n"
                + "        WHEN p.payment_id IS NOT NULL THEN o.order_id\n"
                + "        WHEN po.order_id IS NOT NULL THEN po.order_id\n"
                + "    END AS 'referenceId'\n"
                + "    \n"
                + "    \n"
                + "FROM \n"
                + "    (SELECT * FROM Payment WHERE payment_date >= DATEADD(day, -?, GETDATE())) p\n"
                + "    FULL OUTER JOIN (SELECT * FROM PurchaseOrder WHERE order_date >= DATEADD(day, -?, GETDATE())) po ON 1=0\n"
                + "    LEFT JOIN Orders o ON p.order_id = o.order_id\n"
                + "    LEFT JOIN Users u ON (o.user_id = u.user_id OR po.user_id = u.user_id)\n"
                + "    LEFT JOIN Suppliers sup ON po.supplier_id = sup.supplier_id\n"
                + "    LEFT JOIN (SELECT order_id, customer_name FROM Orders) cust ON o.order_id = cust.order_id\n"
                + "WHERE \n"
                + "    (p.payment_id IS NOT NULL AND (p.payment_status LIKE N'%thanh toán 100%' OR p.payment_status = N'Đã thanh toán 100%' OR p.payment_status = N'Thanh toán 50%'))\n"
                + "    OR\n"
                + "    (po.order_id IS NOT NULL)\n"
                + "ORDER BY COALESCE(p.payment_date, po.order_date) DESC;";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, days);
                        ps.setInt(2, days);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TransactionRecord transaction = new TransactionRecord();
                transaction.setType(rs.getString("type"));
                transaction.setReason(rs.getString("reason"));
                transaction.setDate(rs.getTimestamp("date"));
                transaction.setAmount(rs.getBigDecimal("amount"));
                transaction.setReferenceId(rs.getInt("referenceId"));
                transaction.setCreatedBy(rs.getString("createdBy"));

                transactions.add(transaction);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return transactions;
    }

}
