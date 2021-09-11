
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Jeannine"
composer = #"Duke Pearson"
meter = #"(Med. Up Swing)"
kwtempo = #"Med. Up"
kwstyle = #"Swing"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Duke Pearson" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=Bm1NxfevGro"
  arranger = \markup \on-the-fly #played?
    \with-url #url
    \with-color #blue \underline
    \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
}}


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
  \set chordChanges = ##t
as1*4:m7 as:m7 fis1:m7
b1:7 e:7+ a:7 bes:m7 es:9+ as1:7+ es:9+
as:7+ es2:m7 as:7 
des1:7+ g2:m5-7 c:7 f1*2:7+ f1:m7 bes:7 bes:m7 es:7
as1*4:m7 as:m7 fis1:m7
b1:7 e:7+ a:7 bes:m7 es:9+ as1:7+ es:9+
}

voltaOne = \markup { 1. \text { & } 3.}


theNotes =  \relative c'' {
  \clef "treble" \key as \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    \A
    r8 es4-. r8 es4-. r | r8 es4-. r8 es4-. f-. 
    ges--( f8 es ~ es2 ~ | es1) 
    r8 es4-. r8 es4-. r | r8 es4-. r8 es4-. f-. 
    ges-- f8 es ~ es2 ~ | es r8 c des as' ~ \break
    as4. e8-. r des4-. a8 | as'!4-- g8 ges-> ~ ges as ges b-> ~ 
    b2 ~ b8 bes b ges-> ~ | ges2. e8 es~  | es4. es8 r2
    r8 bes( \times 2/3 { c des es } ges4 e8 es) ~ | 
  }
  \alternative {
    { es1 ~ | es1  }
      {  es2 \repeatTie \times 2/3 { es4 c es } f2 es }
    }
    \bar "||" \break
    \B
     as,2 ~ as8( bes \times 2/3 { c des es } | f4-.) r8 g->~g( f g a->) ~ 
    a1 
    r8 e4.-> \times 2/3 { f4 g a } 
    as?2 \times 2/3 { as4 g as } | 
    bes2 f bes1 ~ bes2. r4 \bar "||" \break

  \A
  r8 es,4-. r8 es4-. r | r8 es4-. r8 es4-. f-. 
  ges-- f8 es ~ es2 ~ | es1 
   r8 es4-. r8 es4-. r | r8 es4-. r8 es4-. f-. 
  ges-- f8 es ~ es2 ~ | es r8 c des as' ~ \break
  as4. e8-. r des4-. a8 | as'!4-- g8 ges-> ~ ges as ges b-> ~ 
  b2 ~ b8 bes b ges-> ~ | ges2. e8 es~ | es4. es8 r2
  r8 bes( \times 2/3 { c des es } ges4 e8 es) ~ | 
 es1 ~ | es1 \bar ".."
}

theNotesII =  \relative c'' {
  \clef "treble" \key as \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    \A
    r8 es4-. r8 es4-. r | r8 es4-. r8 es4-. f-. 
    ges--( f8 es ~ es2 ~ | es1) \break
    r8 es4-. r8 es4-. r | r8 es4-. r8 es4-. f-. 
    ges--( f8 es ~ es2 ~ | es) r8 c des as' ~ \break
    as4. e8-. r des4-. a8 | as'!4-- g8 ges-> ~ ges as ges b-> ~ 
    b2 ~ b8 bes b ges-> ~ | ges2. e8 es~  | \break
    es4. es8 r2
    r8 bes( \times 2/3 { c des es } ges4 e8 es) ~ | 
  }
  \alternative {
    { es1 ~ | es1  }
      {  es2 \repeatTie \times 2/3 { es4 c es } f2 es }
    }
    \bar "||" \break
    \B
     as,2 ~ as8( bes \times 2/3 { c des es } | f4-.) r8 g->~g( f g a->) ~ 
    a1 
    r8 e4.-> \times 2/3 { f4 g a } \break
    as?2 \times 2/3 { as4 g as } | 
    bes2 f bes1 ~ bes2. r4 \bar "||" \break

  \A
  r8 es,4-. r8 es4-. r | r8 es4-. r8 es4-. f-. 
  ges--( f8 es ~ es2 ~ | es1)  \break
   r8 es4-. r8 es4-. r | r8 es4-. r8 es4-. f-. 
  ges--( f8 es ~ es2 ~ | es) r8 c des as' ~ \break
  as4. e8-. r des4-. a8 | as'!4-- g8 ges-> ~ ges as ges b-> ~ 
  b2 ~ b8 bes b ges-> ~ | ges2. e8 es~ |  \break
  es4. es8 r2
  r8 bes( \times 2/3 { c des es } ges4 e8 es) ~ | 
 es1 ~ | es1 \bar ".."
}


grille = \chordmode {
  \bar "[|:"
 \repeat percent 4 as1:m7 \break \repeat percent 4 as1:m7 \break
 fis:m7 b:7 e:7+ a:7 \break
 bes:m7 es:9+ as:7+ \set Score.repeatCommands = #'((volta "1")) es:9+  
 \set Score.repeatCommands = #'((volta #f)end-repeat) \break
 \stopStaff s \bar "" s \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2"))
 \/ es2:m7 as:7 \startStaff \set Score.repeatCommands = #'((volta #f)) \bar "||" \break
 des1:7+ \/ g2:m5-7 c:7 \startStaff \repeat percent 2 f1:7+ \break
 f1:m7 bes:7 bes:m7 es:7 \break
 \repeat percent 4 as1:m7 \break \repeat percent 4 as1:m7 \break
 fis:m7 b:7 e:7+ a:7 \break
 bes:m7 es:9+ as:7+ es:9+
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*19 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } 
        <<
          \new Voice \theNotesII
      >> >>
  }  }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
            \new Voice \transpose c d \theNotesII
      >> >>

  }  }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
            \new Voice  \transpose c a \theNotesII
      >> >>
  }  }
  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \transpose c a \grille
      >>
} } }