package traites.editor

import java.beans.PropertyEditorSupport
import java.text.SimpleDateFormat
import java.text.ParseException
 
/**
 * A property editor that allows for handling many different
 * date formats at once (as opposed to Spring's default CustomDateEditor
 * which only handles one date format configured at instantiation)
 *
 * This class is modified from information found at:
 * http://stackoverflow.com/questions/963922/grails-date-unmarshalling
 */
class CustomDateEditor extends PropertyEditorSupport {
 
  private final List< String> formats
 
  CustomDateEditor() {
    // in our production code, we get the formats from our Grails config
    def formats = [ "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss"]
    List< String> formatList = new ArrayList< String>(formats.size())
    formats.each { format ->
      formatList << format.toString() // Force String values (eg. for GStrings)
    }
    this.formats = Collections.unmodifiableList(formatList)
  }
 
  def String getAsText() {
    return this.value.toString()
  }
 
  def void setAsText(String s) throws IllegalArgumentException {
    if (s) {
      formats.each { format ->
        def df = new SimpleDateFormat(format)
        try {
          this.value = df.parse(s)
          return
        } catch (ParseException e) {
          // Ignore
        }
      }
    }
  }
}