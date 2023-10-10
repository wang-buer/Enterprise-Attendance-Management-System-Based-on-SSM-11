package com.eams.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eams.dao.ReceiptsDao;
import com.eams.model.PageCount;
import com.eams.model.Receipts;
import com.eams.service.ReceiptsService;

@Service("receiptService")
public class ReceiptsServiceImpl  implements ReceiptsService{

	@Autowired
	private ReceiptsDao receiptsDao;

	public List<Receipts> getReceiptsList(PageCount param) {

		return receiptsDao.getReceiptsList(param);
	}

	public int delReceipts(Integer param) {

		return receiptsDao.delReceipts(param);
	}

	public Integer getReceiptsCount() {

		return receiptsDao.getReceiptsCount();
	}

	public int insertReceipts(Receipts param) {

		return receiptsDao.insertReceipts(param);
	}

	public int updateReceipts(Receipts param) {

		return receiptsDao.updateReceipts(param);
	}
	
}
