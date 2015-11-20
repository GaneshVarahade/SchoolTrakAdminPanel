package com.fidelit.service;

public interface GtsService {
    void addAccountInGts(String accountId);

	void addCorridorInGts(String accountId, String corridorID,
			String description);
}
