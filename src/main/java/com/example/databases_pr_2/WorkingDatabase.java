package com.example.databases_pr_2;


import com.example.databases_pr_2.Models.Buyer;
import com.example.databases_pr_2.Models.Order;
import com.example.databases_pr_2.Models.Product;
import com.example.databases_pr_2.Models.Seller;
import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import com.microsoft.sqlserver.jdbc.SQLServerException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class WorkingDatabase {

    private final List<Seller> sellerList;
    SQLServerDataSource ds;

    public WorkingDatabase() {
        ds = new SQLServerDataSource();
        ds.setUser("sa");
        ds.setPassword("123456");
        ds.setServerName("192.168.0.103");
        ds.setPortNumber(1433);
        ds.setDatabaseName("SalesDB");
        ds.setEncrypt("false");

        sellerList = new ArrayList<>();
    }

    public List<Seller> getAllSellers() {
        List<Seller> sellerList = new ArrayList<>();

        String sellers = "select * from Sellers";
        try(Connection cn = ds.getConnection()) {

            Statement st = cn.createStatement();

            ResultSet rs_1 = st.executeQuery(sellers);

            while (rs_1.next()) {
                sellerList.add(new Seller(rs_1.getInt(1), rs_1.getString(2),
                        rs_1.getString(3), rs_1.getString(4)));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return sellerList;
    }

    public String getSellerName(int Id) {
        String seller = "select SellerName from Sellers where Id = ?";

        try(Connection cn = ds.getConnection()) {
            PreparedStatement ps = cn.prepareStatement(seller);
            ps.setInt(1, Id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return "";
    }

    public List<Buyer> getAllBuyers() {
        List<Buyer> buyerList = new ArrayList<>();

        String buyers = "select * from Buyers";
        try(Connection cn = ds.getConnection()) {
            Statement st = cn.createStatement();
            ResultSet rs_1 = st.executeQuery(buyers);

            while (rs_1.next()) {
                buyerList.add(new Buyer(rs_1.getInt(1), rs_1.getString(2),
                        rs_1.getString(3), rs_1.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return buyerList;
    }

    public void addProduct(Product product) {
        this.sellerList.addAll(getAllSellers());

        try(Connection cn = ds.getConnection()) {

            if (!sellerList.isEmpty()) {
                Random rand = new Random();
                int size = sellerList.size() - 1;
                String insertProduct = "insert into Products (ProductName, Price, SellerId) values (?,?,?)";

                if (product != null) {
                    PreparedStatement ps = cn.prepareStatement(insertProduct);

                    ps.setString(1, product.getProductName());
                    ps.setDouble(2, product.getPrice());
                    ps.setInt(3, rand.nextInt(size));

                    ps.execute();
                }
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void addOrder(Order order) {
        String command = "insert into Orders (ProductId, SellerId, BuyersId, Quantity, SaleDate) values (?, ?, ?, ?, ?)";

        try(Connection cn = ds.getConnection()) {
            if (order != null) {
                PreparedStatement ps = cn.prepareStatement(command);
                ps.setInt(1, order.getProductId());
                ps.setInt(2, order.getSellerId());
                ps.setInt(3, order.getBuyerId());
                ps.setInt(4, order.getQuantity());
                ps.setDate(5, order.getSaleDate());
                ps.execute();
            }


        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public List<Order> getAllOrders() {
        List<Order> orderList = new ArrayList<>();
        String orders = "select * from Orders";

        try(Connection cn = ds.getConnection()) {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(orders);
            while (rs.next()) {
                orderList.add(new Order(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getInt(5), rs.getDate(6)));
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return orderList;
    }

    public List<Order> getOrdersByDate(Date date) {
        List<Order> orderList = new ArrayList<>();
        String orders = "select * from Orders where SaleDate = ?";

        try(Connection cn = ds.getConnection()) {
            PreparedStatement ps = cn.prepareStatement(orders);
            ps.setDate(1, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderList.add(new Order(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getInt(5), rs.getDate(6)));
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return orderList;
    }

    public List<Order> getOrdersByDate(Date date1, Date date2) {
        List<Order> orderList = new ArrayList<>();
        String orders = "select * from Orders where SaleDate >= ? && SaleDate <= ?";

        try(Connection cn = ds.getConnection()) {
            PreparedStatement ps = cn.prepareStatement(orders);
            ps.setDate(1, date1);
            ps.setDate(2, date2);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                orderList.add(new Order(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getInt(5), rs.getDate(6)));
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return orderList;
    }

    public Product getProduct(int Id) {
        String command = "select * from Products where Id = ?";
        Product product = null;

        try(Connection cn = ds.getConnection()) {
            PreparedStatement ps = cn.prepareStatement(command);
            ps.setInt(1, Id);
            ResultSet rs = ps.executeQuery();
            product = new Product();
            while (rs.next()) {
                product.setId(rs.getInt(1));
                product.setProductName(rs.getString(2));
                product.setPrice(rs.getDouble(3));
                product.setSellerId(rs.getInt(4));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return product;
    }

    public List<Product> getAllProducts() {
        String command = "select * from Products";
        List<Product> products = null;

        try(Connection cn = ds.getConnection()) {
            Statement ps = cn.createStatement();
            ResultSet rs = ps.executeQuery(command);
            products = new ArrayList<>();

            while (rs.next()) {
                products.add(new Product(rs.getInt(1), rs.getString(2),
                        rs.getDouble(3), rs.getInt(4)));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return products;
    }

    public void editProduct(Product product) {
        String command = "update Products set ProductName = ?, Price = ?, SellerId = ? where Id = ?";

        try(Connection cn = ds.getConnection()) {
            PreparedStatement ps = cn.prepareStatement(command);
            ps.setString(1, product.getProductName());
            ps.setDouble(2, product.getPrice());
            ps.setInt(3, product.getSellerId());
            ps.setInt(4, product.getId());
            ps.execute();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteProduct(int Id) {
        String command = "delete from Products where Id = ?";

        try(Connection cn = ds.getConnection()) {
            PreparedStatement ps = cn.prepareStatement(command);
            ps.setInt(1, Id);
            ps.execute();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
