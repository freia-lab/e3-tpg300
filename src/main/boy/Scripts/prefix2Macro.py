from org.csstudio.display.builder.runtime.script import PVUtil

prefix = PVUtil.getString(pvs[0])

widget.getPropertyValue("macros").add("TPG3002Macro", prefix)
