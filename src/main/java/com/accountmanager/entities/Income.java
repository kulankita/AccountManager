package com.accountmanager.entities;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;

import com.accountmanager.repository.IncomeRepo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "incomes")
public class Income {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@Column
	private Date date;
	@Column
	private String name;
	@Column(name = "desc")
	private String description;
	@Column(name = "amt")
	private double amount;
	@Column
	private String mode;
	@Column(name = "txn_id")
	private String transactionId;

	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false)
	private User user;

	@ManyToOne
	@JoinColumn(name = "income_category_id", nullable = false)
	private IncomeCategory incomeCategory;
	
	
	

	public Income() {
		// TODO Auto-generated constructor stub
	}

	

	public Income(Date date, String name, String description, double amount, String mode, String transactionId,
			User user, IncomeCategory incomeCategory) {
		super();
		this.date = date;
		this.name = name;
		this.description = description;
		this.amount = amount;
		this.mode = mode;
		this.transactionId = transactionId;
		this.user = user;
		this.incomeCategory = incomeCategory;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public IncomeCategory getIncomeCategory() {
		return incomeCategory;
	}

	public void setIncomeCategory(IncomeCategory incomeCategory) {
		this.incomeCategory = incomeCategory;
	}



	@Override
	public String toString() {
		return "Income [id=" + id + ", date=" + date + ", name=" + name + ", description=" + description + ", amount="
				+ amount + ", mode=" + mode + ", transactionId=" + transactionId + ", user=" + user
				+ ", incomeCategory=" + incomeCategory + "]";
	}

	

}
