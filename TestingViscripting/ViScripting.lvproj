<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="17008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Commands" Type="Folder" URL="../Commands">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="CommandTemplates" Type="Folder" URL="../CommandTemplates">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Utils" Type="Folder" URL="../Utils">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="CreateExecuteCommand.vi" Type="VI" URL="../CreateExecuteCommand.vi"/>
		<Item Name="ExecuteCommand.vi" Type="VI" URL="../ExecuteCommand.vi"/>
		<Item Name="ExecuteCommandTemplate.vi" Type="VI" URL="../ExecuteCommandTemplate.vi"/>
		<Item Name="Main.vi" Type="VI" URL="../Main.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVPointTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPointTypeDef.ctl"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
