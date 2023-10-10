package com.eams.dao;

import java.util.List;

import com.eams.model.Adept;
import com.eams.model.PageCount;
import com.eams.model.Receipts;

public interface ReceiptsDao {

	public List<Receipts> getReceiptsList(PageCount param );
	public int delReceipts(Integer param);
	public Integer getReceiptsCount();
	public int insertReceipts(Receipts param);
	public int updateReceipts(Receipts param);
}
