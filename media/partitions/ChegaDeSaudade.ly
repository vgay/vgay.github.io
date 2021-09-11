
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

title = #"Chega De Saudade"
composer = #"Tom Jobim"
meter = #"(Med. Bossa Nova)"
kwtempo = #"Medium"
kwstyle = #"Bossa"

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
  \set chordChanges = ##f
  d1:m \parenthesize d:m7/c e1*2:7/b a:5+7.9-11+ d1:m e2:m5-7 a:7
  d1:m b2:m5-7 e:7 a1*2:m bes1:7+ bes:6 a1*2:9-
  d1:m \parenthesize d:m7/c e1*2:7/b a:5+7.9-11+ d1:m d:9-
  g:m a:7 d:m \parenthesize d:m7/c e:9- a:5+7.9-11+ d:m e2:m7 a:7
  d1:7+ b:5+7/dis e1*2:m7 a1:9sus4 a:7 d:dim d:7+
  fis:m7 f:dim e1*2:m7 e:9 g1:m6 a:7
  d:7+ b:m7 e1*2:m7 fis:7 b2:m7 bes:m7 a:m7 d:7
  g1:7+ g:m7 fis:m7 b2:13 b:5+7 e1:9 a:13sus4 fis:m7 b:5+7
  e:9 a:9sus4 d:6 \parenthesize a:5+7
  fis:m7 b:5+7 e:9 a:9sus4 a2.:9sus4 d8:6
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4
\set Staff.extraNatural = ##f 
\A
f4. a,8 ~ a4. d8 ~ | d2 ~ d8 f4 e8 ~ 
e4. b8 ~ b4. d8 ~ | d2 ~ d8 e4 f8 ~ 
f4. bes,?8 ~ bes4. cis8 ~ | cis2 ~ cis8 f4 e8 ~
e8 d4 f8 e d4 a8 ~ | a1 \break
f'4. a,8 ~ a4. b8 ~ | b2 ~ b8 d4 c8 ~ 
c4. e8 ~ e2 ~ | e4 e8 d ~ d c4 c8 ~
c4. bes?8 ~ bes2 ~ | bes4 f'8 e ~ e d4 d8 ~ 
d cis4 e8 cis?4 bes ~ | bes2. a4 \bar "||"  \break
\B
f'4. a,8 ~ a4. d8 ~ | d2 ~ d8 f4 e8 ~ 
e4. b8 ~ b4. d8 ~ | d2 ~ d8 e4 f8 ~ 
f4. bes,8 ~ bes4. cis8 ~ | cis2 ~ cis8 f4 e8 ~
e d4 cis8 d4 es ~ | es d8 fis ~ fis a4 g8 ~ \break
g4. bes8 ~ bes4. cis,8 ~ | cis2 r8 \breathe a'4 g8 ~
g f4 a8 ~ a g f4 | e d8 cis ~ cis d4 f8 ~
f d4 b8 ~ b d4 f8 ~ | f cis4 bes?8 ~ bes f'4 d8 ~ d1  R1
\once \override Staff.KeySignature.color = #(x11-color 'red)
\key d \major \bar "||"  \pageBreak \C
fis2.. a8 ~ | a4. g8 ~ g dis4 fis8 ~ |
fis4. e8 dis e4 b'8 ~ | b4 g8 e ~ e b4 d8 ~
d4. cis8 ~ cis2 ~ | cis4 e8 cis ~ cis a4 b8 ~
b2.. a8 ~ | a2 ~ a8 cis4 e8 ~ \break
e d4 cis8 ~ cis d4 f8 ~ | f gis4 cis8 ~ cis b4 a8 ~
a g!4 b,8 ~ b2 ~ | b4 b8 cis ~ cis d4 fis8 ~
fis e4 d8 b4 gis ~ | gis b8 cis ~ cis e4 d8 ~
d2.. cis?8 ~ | cis1 \bar "||"  \break
\mark \markup \bold \box "D"
fis4. a,8 ~ a4. b8 ~ | b2 ~ b8 fis'4 e8 ~ | e4. b8 ~ b4. d8 ~
d2 ~ d8 e4 fis8 ~ | fis4. ais,8 ~ ais4. cis8 | 
cis2 ~ cis8 fis4 e8 ~ | e d4 cis8 d4 e ~
e d8 fis ~ fis b4 a8 ~ | \break
a fis4 d8 ~ d b4 a'8 ~ | a f4 d8 ~ d bes4 a'8 ~ 
a e4 cis8 ~ cis a4 gis'8 ~ | gis b4 g8 ~ g b4 fis8 ~
fis d4 b8 d4 fis ~ | fis d8 b ~ b d4 fis8 ~ \break
\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
\Coda
fis2 ~ fis8 fis g a | b4 a8 g ~ g fis4 d8 ~

d b4 d8 fis4 d ~ | d b8 d ~ d fis4 d8 ~ 
\once \override TextScript #'extra-offset = #'( 7 . 0 ) 
d1 R \bar ".|:-||" \break
\Coda \repeat volta 3 {
fis2 \repeatTie ~ fis8 fis g a | b4 a8 g ~ g fis4 d8 ~
d b4 d8 fis4 d ~ | }
\alternative {
  { d b8 d ~ d fis4 fis8 \laissezVibrer }
  {d b8 d ~ d fis4 d8-^ }
}
\once \override Score.RehearsalMark.extra-offset = #'(0 . 1)
\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
\mark \markup \with-color #red "Chorus sur A-B puis directement à D"

  \bar "|."
}

grille = \chordmode {
d1:m d:m7/c \repeat percent 2 e:7/b \break
\repeat percent 2 a:5+7.9-11+ d:m \/e2:m5-7 a:7 \startStaff \break
d1:m \/b2:m5-7 e:7 \startStaff \repeat percent 2 a1:m \break
bes:7+ bes:6 \repeat percent 2 a:9- \break
d1:m d:m7/c \repeat percent 2 e:7/b \break
\repeat percent 2 a:5+7.9-11+ d:m d:9+ \break
g:m a:7 d:m d:m7/c \break
e:9- a:5+7.9-11+ d:m \/e2:m7 a:7 \startStaff \break
d1:7+ b:5+7/dis \repeat percent 2 e:m7 \break
a:9sus4 a:7 d:dim d:7+ \break
fis:m7 f:dim \repeat percent 2 e:m7 \break
\repeat percent 2 e:9 g:m6 a:7 \pageBreak
d:7+ b:m7 \repeat percent 2 e:m7 \break
\repeat percent 2 fis:7 \/b2:m7 bes:m7 \/a:m7 d:7 \break
\startStaff g1:7+ g:m7 fis:m7 \/b2:13 b:5+7 \startStaff  \break
e1:9 a:13sus4 \Coda fis:m7 b:5+7 \break
e:9 a:9sus4 d:6 a:5+7 \break
\Coda \bar "[|:" fis:m7 b:5+7 e:9 \set Score.repeatCommands = #'((volta "1")) 
a:9sus4   \set Score.repeatCommands = #'((volta #f) end-repeat) \break
\stopStaff s1 \bar "" s1 \bar "" s \startStaff 
\set Score.repeatCommands = #'((volta "2")) \/a2:9sus4 d:6 
  \set Score.repeatCommands = #'((volta #f))
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*15 
  s1 ^\markup \bold \box \fontsize #7 B s1*15 
  s1 ^\markup \bold \box \fontsize #7 C s1*15 
  s1 ^\markup \bold \box \fontsize #7 D
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \header { arranger = \markup \with-color #red \pad-around #1 "Partition sur 2 pages" }
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
    page-count = #2
  }
  #(define output-suffix "BbTab") 
  \header { arranger = \markup \with-color #red \pad-around #1 "Partition sur 2 pages" }
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
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \header { arranger = \markup \with-color #red \pad-around #1 "Partition sur 2 pages" }
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
  #(define output-suffix "Ca4")
  \bookpart {
   \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
   \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } 
        <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
      >> >>
%   }   
%   \markup \pad-markup #2 " "
  } }
  \bookpart {
   \paper {
    #(set-paper-size "a4")
    page-count = #2
  }    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
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
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  #(define output-suffix "Bba4") 
  \bookpart {
    \paper {
    #(set-paper-size "a4")
    page-count = #1
  }   \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
%   }   
%   \markup \pad-markup #2 " "
  } }
  \bookpart {
   \paper {
    #(set-paper-size "a4")
    page-count = #2
  }    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
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
          \consists "Volta_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  #(define output-suffix "Eba4")
  \bookpart {
   \paper {
    #(set-paper-size "a4")
    page-count = #1
  }    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          \new Voice  \transpose c a \theNotes
      >> >>
%   }   
%   \markup \pad-markup #2 " "
  } }
  \bookpart {
   \paper {
    #(set-paper-size "a4")
    page-count = #2
  }    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
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
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }