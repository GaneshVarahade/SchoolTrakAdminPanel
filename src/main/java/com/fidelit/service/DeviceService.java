package com.fidelit.service;

import java.util.List;

import com.fidelit.model.Device;

public interface DeviceService {

	List<Device> getAllDeviceByUsername(String userName);

	void addDevice(Device device);

	void deleteDeviceByUniqueIdAndAccountId(String uniqueId,
			String userName);
}
